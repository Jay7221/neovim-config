local opt = vim.opt	-- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true


-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- Competitive programming specific settings
opt.scrolloff = 8         -- Keep 8 lines above/below cursor
opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor
opt.updatetime = 250      -- Faster completion (default is 4000ms)
opt.timeoutlen = 300      -- Faster key sequence completion
opt.mouse = "a"           -- Enable mouse support
opt.showmode = false      -- Don't show mode in command line (status line shows it)

-- Better search experience
opt.hlsearch = true       -- Highlight search results
opt.incsearch = true      -- Show search results as you type

-- Performance improvements
opt.lazyredraw = true     -- Don't redraw during macros
opt.ttyfast = true        -- Fast terminal connection

-- Configure netrw (built-in file explorer)
vim.g.netrw_banner = 0        -- Disable banner
vim.g.netrw_liststyle = 3     -- Tree view
vim.g.netrw_browse_split = 4  -- Open in previous window
vim.g.netrw_altv = 1          -- Open splits to the right
vim.g.netrw_winsize = 25      -- 25% of the screen for netrw
