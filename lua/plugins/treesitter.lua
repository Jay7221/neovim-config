return {
  'nvim-treesitter/nvim-treesitter',
  -- It's common to set branch = 'master' and build = ':TSUpdate' for treesitter
  branch = 'master',
  build = ':TSUpdate', -- Ensures parsers are updated when installing/updating plugin
  -- 'VeryLazy' ensures it loads early enough for highlighting without blocking startup
  event = "VeryLazy",

  opts = {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    -- Added "cpp" explicitly here for C++ highlighting.

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (or "all")
    -- Ensure you don't list "cpp" or "c" here if you want them highlighted
    ignore_install = { "javascript" }, -- Retained from your example

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

    -- If you want to use treesitter textobjects (like 'af' for around function)
    -- This section is commonly included, but remove if not needed.
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- Common text object keymaps; uncomment and customize as desired
          -- ["af"] = "@function.outer",
          -- ["if"] = "@function.inner",
          -- ["ac"] = "@class.outer",
          -- ["ic"] = "@class.inner",
        },
      },
      swap = { enable = false }, -- Set to true if you want swap textobjects
      move = { enable = false }, -- Set to true if you want move textobjects
    },
  },

  -- The config function is where the nvim-treesitter setup is actually called
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
