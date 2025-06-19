return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Load this plugin on startup since it's your colorscheme
    priority = 1000, -- Make sure it loads before other plugins
    opts = {
      style = "moon", -- Choose your desired style (e.g., "storm", "night", "day")
      -- Other configuration options for tokyonight.nvim
      transparent = false, -- Set to true for a transparent background
      terminal_colors = true, -- Enable terminal colors
      styles = {
        comments = { "italic" },
        keywords = { "italic" },
        functions = { "italic" },
        variables = { "italic" },
        -- Customize specific highlight groups
      },
    },
  },
  -- You can add other color-related plugins here too, like nvim-colorizer.lua
  {
    "norcalli/nvim-colorizer.lua",
    opts = {}, -- Default options are usually fine, or configure as needed
    -- Event to lazy-load the colorizer, e.g., when you open a buffer
    event = "BufReadPre",
    config = function()
      require("colorizer").setup()
    end,
  },
}
