return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects', -- For textobject functionality
  },
  branch = 'master',
  build = ':TSUpdate', -- Ensures parsers are updated when installing/updating plugin
  event = "VeryLazy",

  opts = {
    -- Focus on competitive programming languages
    ensure_installed = {
      "c", "cpp", "go", "rust",
      "lua", "vim", "vimdoc", "query",
      "markdown", "markdown_inline",
      "bash", "json", "yaml" -- Useful for config files
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- Don't install parsers we don't need for competitive programming
    ignore_install = { "javascript", "typescript", "html", "css" },

    highlight = {
      enable = true,

      -- Use the function for dynamic disabling based on file size as you had
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
        return false -- Important: return false if not disabled by size
      end,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      additional_vim_regex_highlighting = false,
    },

    -- Indent is often enabled with treesitter for better auto-indentation
    indent = { enable = true },

    -- Simplified textobjects for competitive programming
    -- Focus on functions and basic code navigation
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- Essential for competitive programming
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
            ["]f"] = "@function.outer",
        },
        goto_previous_start = {
            ["[f"] = "@function.outer",
        },
      },
    },
  },

  -- The config function is where the nvim-treesitter setup is actually called
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
