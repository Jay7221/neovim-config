-- Minimal LSP setup for competitive programming
-- This version skips C++ LSP entirely and focuses on Go/Rust only

return {
  -- LSP Configuration - minimal version for competitive programming
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

      -- Setup Mason LSP Config - only Go and Rust
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",      -- Go
          "rust_analyzer", -- Rust
        },
        automatic_installation = true,
      })

      -- LSP settings
      local lspconfig = require("lspconfig")
      
      -- Common on_attach function for LSP servers
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        
        -- Essential keymaps
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      end

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
      
      -- Message about C++ LSP
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "cpp", "c" },
        once = false,
      })
    end,
  },
}
