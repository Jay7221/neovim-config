return {
  -- Treesitter for better syntax highlighting
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },

  -- Common Lua functions used by lots of plugins
  { "nvim-lua/plenary.nvim" },

  -- Fuzzy finder over lists
  { "nvim-telescope/telescope.nvim" },

  "folke/neodev.nvim",
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  {
	  'xeluxee/competitest.nvim',
	  dependencies = 'MunifTanjim/nui.nvim',
	  config = function() require('competitest').setup() end,
  },
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
}
