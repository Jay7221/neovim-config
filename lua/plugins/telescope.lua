return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8', -- Or ', branch = '0.1.x',' if you prefer the release branch
  dependencies = {
    'nvim-lua/plenary.nvim', -- Essential dependency for Telescope
    -- Enable fzf-native for better performance
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  -- Load Telescope when any Telescope command is used

  config = function()
    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        -- Optimized for competitive programming
        file_ignore_patterns = {
          "%.git/",
          "%.DS_Store",
          "target/", -- Rust build directory
          "build/",  -- C/C++ build directory
          "*.o",     -- Object files
          "*.exe",   -- Windows executables
          "*.out",   -- Linux executables
          "*.swp",   -- Neovim swap files
        },

        -- Faster search with ripgrep
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '--glob', '!{.git,target,build}/*',
        },

        -- UI improvements
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },

        -- Performance settings
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        sorting_strategy = "ascending",
      },

      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!{.git,target,build}/*" },
        },
      },
    })

    -- Load fzf extension for better performance
    telescope.load_extension('fzf')
  end,
}
