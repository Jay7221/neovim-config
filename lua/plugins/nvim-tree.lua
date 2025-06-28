return {
  'nvim-tree/nvim-tree.lua',
  -- tag = 'v1.4.0', -- Use a specific tag for stability, or omit for latest 'main'
  -- event = "VimEnter", -- uncomment if you want nvim-tree to open automatically on startup
  -- Or use `cmd = "NvimTreeToggle"` for true lazy loading when the command is first run.
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose" },

  dependencies = {
    'kyazdani42/nvim-web-devicons', -- Required for file icons (needs a Nerd Font)
  },

  config = function()
    local nvimtree = require('nvim-tree')

    -- Setup nvim-tree
    nvimtree.setup({
      -- Configure view options
      view = {
        width = 30, -- Default width of the tree
        relativenumber = true, -- Show relative line numbers in the tree
        signcolumn = "yes",    -- Always show the sign column (for git signs, etc.)
        -- You can choose a different float position if you want, e.g., "right" or "center"
        -- auto_resize = true, -- Automatically resize the tree width
      },
      -- Configure renderer options
      renderer = {
        group_empty = true, -- Collapse empty folders
        full_name = true,   -- Show full file names (including extensions)
        -- Highlight git status (requires a git plugin like fugitive or diffview)
        highlight_git = true,
        -- icons = {
        --   -- Customize icons (requires nvim-web-devicons and a Nerd Font)
        --   git_placement = "before", -- Show git icons before file icons
        --   padding = " ",
        --   symlink_arrow = " ➜ ",
        --   show = {
        --     file = true,        -- Show file icons (from devicons if available)
        --     folder = true,      -- Show folder icons
        --     folder_arrow = true,-- Show arrow for open/closed folders
        --     git = true,         -- Show git status icons
        --   },
        --   glyphs = {
        --     -- These are fallback/default icons if nvim-web-devicons doesn't have a specific match,
        --     -- or for folder/git states.
        --     default = "",      -- A generic file icon
        --     symlink = "",      -- Symlink icon
        --     folder = {
        --       default = "",    -- Closed folder icon
        --       open = "",       -- Open folder icon
        --       empty = "",      -- Empty folder icon
        --       empty_open = "",  -- Open empty folder icon
        --       symlink = "",    -- Symlink folder icon
        --       symlink_open = "", -- Open symlink folder icon
        --     },
        --     git = {
        --       unstaged = "✗",  -- Modified/unstaged file
        --       staged = "✓",   -- Staged file
        --       untracked = "★", -- Untracked file
        --       renamed = "➜",   -- Renamed file
        --       deleted = "",   -- Deleted file
        --       unmerged = "",  -- Unmerged file
        --     },
        --   },
        -- },
      },
      -- Configure update options
      update_focused_file = {
        enable = true,      -- Automatically reveal and select the current buffer's file in the tree
        update_root = true, -- Update the tree root to the current file's directory if outside the current root
        ignore_list = {},   -- List of patterns to ignore when updating focused file
      },
      -- Configure filters (what files/folders to hide)
      filters = {
        dotfiles = false,      -- Hide dotfiles (files starting with '.')
        git_ignored = false,   -- Hide git ignored files (requires git in project root)
        custom = { "node_modules", ".git", "target", ".DS_Store", "build", "dist" }, -- Custom list of files/folders to hide
      },
      -- Configure actions (what happens on certain events)
      actions = {
        open_file = {
          quit_on_open = false,    -- Don't close nvim-tree after opening a file
          resize_window = true,    -- Resize window after opening a file
          window_picker = {
            enable = true,         -- Prompt to pick a window if multiple are open
            -- This is useful if you have many splits and want to select which one to open the file in
          },
        },
      },
      -- Disable built-in netrw (recommended)
      disable_netrw = true,
      -- Open nvim-tree automatically when Neovim starts with no arguments
      -- This is just an alternative to `event = "VimEnter"` in the plugin spec.
      -- auto_reload_on_write = true, -- Reload the tree when files are written
      hijack_netrw = true, -- Hijack default netrw behavior
      sync_root_with_cwd = true, -- Sync nvim-tree root with current working directory
      -- respect_folders_on_load = true, -- Open folders in tree that were open last session
    })
  end,
}
