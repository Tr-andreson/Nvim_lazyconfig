return {
  -- Extend auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "Saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = true,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local autocomplete_enabled = false -- Define a variable to track the autocompletion state

      -- Disable automatic completion initially
      opts.completion = {
        autocomplete = false, -- Disable auto-triggering of completion
      }

      -- Add sources for completion
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "crates", priority = 750 },
      }))

      -- Key mappings for manual completion
      opts.mapping = {
        ["<C-p>"] = cmp.mapping.complete(), -- Manual completion with Ctrl + P
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Enter
      }

      -- Key mapping to toggle autocompletion on and off with Ctrl + T
      vim.api.nvim_set_keymap("n", "<C-t>", "", {
        noremap = true,
        silent = true,
        callback = function()
          autocomplete_enabled = not autocomplete_enabled
          if autocomplete_enabled then
            print("Autocompletion: Enabled")
            cmp.setup({
              completion = { autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged } },
            })
          else
            print("Autocompletion: Disabled")
            cmp.setup({
              completion = { autocomplete = false },
            })
          end
        end,
      })
    end,
  },

  -- Add Rust to Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "rust", "toml" })
      end
    end,
  },

  -- Setup Mason LSP/DAP extensions
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "codelldb", "rust-analyzer", "taplo" })
      end
    end,
  },

  -- Setup LSP for Rust
  {
    "neovim/nvim-lspconfig",
    dependencies = { "simrat39/rust-tools.nvim" },
    opts = {
      -- Make sure mason installs the server
      servers = {
        rust_analyzer = {},
      },
      setup = {
        rust_analyzer = function(_, opts)
          require("lazyvim.util").lsp.on_attach(function(client, buffer)
            if client.name == "rust_analyzer" then
              vim.keymap.set("n", "K", "<cmd>RustHoverActions<cr>", { buffer = buffer, desc = "Hover Actions (Rust)" })
              vim.keymap.set(
                "n",
                "<leader>cR",
                "<cmd>RustCodeAction<cr>",
                { buffer = buffer, desc = "Code Action (Rust)" }
              )
              vim.keymap.set(
                "n",
                "<leader>dr",
                "<cmd>RustDebuggables<cr>",
                { buffer = buffer, desc = "Run Debuggables (Rust)" }
              )
            end
          end)

          local mason_registry = require("mason-registry")
          local codelldb = mason_registry.get_package("codelldb")
          local extension_path = codelldb:get_install_path() .. "/extension/"
          local codelldb_path = extension_path .. "adapter/codelldb"
          local liblldb_path = vim.fn.has("mac") == 1 and extension_path .. "lldb/lib/liblldb.dylib"
            or extension_path .. "lldb/lib/liblldb.so"
          local rust_tools_opts = vim.tbl_deep_extend("force", opts, {
            dap = {
              adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
            },
            tools = {
              on_initialized = function()
                vim.cmd([[
                augroup RustLSP
                autocmd CursorHold *.rs silent! lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved,InsertEnter *.rs silent! lua vim.lsp.buf.clear_references()
                autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                augroup END
                ]])
              end,
            },
            server = {
              settings = {
                ["rust-analyzer"] = {
                  cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    runBuildScripts = true,
                  },
                  checkOnSave = {
                    allFeatures = true,
                    command = "clippy",
                    extraArgs = { "--no-deps" },
                  },
                  procMacro = {
                    enable = true,
                    ignored = {
                      ["async-trait"] = { "async_trait" },
                      ["napi-derive"] = { "napi" },
                      ["async-recursion"] = { "async_recursion" },
                    },
                  },
                },
              },
            },
          })
          require("rust-tools").setup(rust_tools_opts)
          return true
        end,
        taplo = function(_, _)
          local function show_documentation()
            if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
              require("crates").show_popup()
            else
              vim.lsp.buf.hover()
            end
          end
          require("lazyvim.util").lsp.on_attach(function(client, buffer)
            if client.name == "taplo" then
              vim.keymap.set("n", "K", show_documentation, { buffer = buffer, desc = "Show Crate Documentation" })
            end
          end)
          return false -- make sure the base implementation calls taplo.setup
        end,
      },
    },
  },
}
