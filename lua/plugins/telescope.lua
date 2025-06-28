return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8', -- Or ', branch = '0.1.x',' if you prefer the release branch
  dependencies = {
    'nvim-lua/plenary.nvim', -- Essential dependency for Telescope
    -- Optional: For better performance, especially on large projects.
    -- If you use this, uncomment the line below and ensure `make` or `cmake` is installed.
    -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  -- Load Telescope when any Telescope command is used

  config = function()
    local builtin = require('telescope.builtin')


    -- Simple setup with file ignore patterns
    require('telescope').setup({
      defaults = {
        -- Exclude common folders from find_files and live_grep by default
        file_ignore_patterns = {
          "%.git/",
          "node_modules/",
          "%.DS_Store",
          "__pycache__/",
          "%.ipynb_checkpoints/",
          "target/", -- For Rust/Java projects
          "build/",  -- For C/C++ or build outputs
          "dist/",   -- For JavaScript/TypeScript build outputs
          "vendor/", -- For Go or PHP dependencies
          "coverage/",
          "*.swp",   -- Neovim swap files
        },
        -- Optional: Use ripgrep and exclude hidden/ignored files for live_grep
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden', -- Include hidden files
          '--glob', '!{.git,node_modules,build,dist,target,vendor,coverage}/*', -- Explicitly exclude these directories
        },
      },



    })

  end,
}
