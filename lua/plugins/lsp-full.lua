return {
  -- LSP Configuration for competitive programming languages
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Setup Mason first
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })

      -- Setup Mason LSP Config
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- C/C++ LSP is optional for competitive programming
          -- Uncomment one of these if you want LSP support:
          -- "clangd",     -- Option 1: clangd (most common)
          -- "ccls",       -- Option 2: ccls (better for competitive programming)

          "gopls",      -- Go
          "rust_analyzer", -- Rust
        },
        automatic_installation = true,
      })

      -- LSP settings
      local lspconfig = require("lspconfig")
      
      -- Common on_attach function for all LSP servers
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        
        -- Essential keymaps for competitive programming
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      end

      -- Configure each language server
      
      -- C/C++ LSP Setup (Optional for competitive programming)
      -- You can enable one of these if you want LSP support:

      -- Option 1: clangd (uncomment if you want to use it)
      --[[
      lspconfig.clangd.setup({
        on_attach = on_attach,
        cmd = { "clangd", "--background-index", "--clang-tidy=false" },
        filetypes = { "c", "cpp" },
      })
      --]]

      -- Option 2: ccls (uncomment if you want to use it)
      --[[
      lspconfig.ccls.setup({
        on_attach = on_attach,
        cmd = { "ccls" },
        filetypes = { "c", "cpp" },
        init_options = {
          clang = {
            extraArgs = { "-std=c++20", "-Wall", "-Wextra" },
          },
        },
      })
      --]]

      -- For competitive programming, LSP is optional since you mainly:
      -- 1. Write short solutions
      -- 2. Use CompetiTest for compilation and testing
      -- 3. Don't need complex refactoring or navigation

      -- Go (gopls)
      lspconfig.gopls.setup({
        on_attach = on_attach,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })

      -- Rust (rust-analyzer)
      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      })

      -- Configure diagnostics
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      -- Diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
}
