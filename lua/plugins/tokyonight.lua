return {
  "folke/tokyonight.nvim",
  lazy = false, -- Load on startup
  priority = 1000, -- Ensures it loads before other plugins that might set colors
  opts = {
    style = "storm", -- or "night", "moon", "day"
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- Backgrounds
      sidebars = "dark", -- "dark", "light", or "transparent"
      floats = "dark", -- "dark", "light", or "transparent"
    },
    -- Your other customizations
  },
  config = function(_, opts)
    vim.cmd.colorscheme("tokyonight-" .. opts.style)
    require("tokyonight").setup(opts)
  end,
}
