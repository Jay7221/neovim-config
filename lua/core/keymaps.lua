vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

-- increment and decrement number under cursor
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- upon x delete a char but don't copy it in register
keymap.set("n", "x", '"_x')

-- creating windows
keymap.set("n", "<leader>sv", "<C-w>v")             -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")             -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")             -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>")         -- close current split window

-- managing tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")        -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")      -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")          -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")          -- go to previous tab

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Toggle nvim-tree
keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>', { desc = 'Find Current File in NvimTree' })
keymap.set('n', '<leader>nr', ':NvimTreeRefresh<CR>', { desc = 'Refresh NvimTree' })
keymap.set('n', '<leader>nc', ':NvimTreeCollapse<CR>', { desc = 'Collapse NvimTree' })
keymap.set('n', '<leader>nC', ':NvimTreeCollapse<CR>:NvimTreeSetRoot<CR>', { desc = 'Collapse & Set Root NvimTree' })
keymap.set('n', '<leader>ns', ':NvimTreeOpen current<CR>', { desc = 'Open NvimTree (current dir)' })


-- Telescope keymaps
-- Find files and grepping
keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = "Find Files" })
keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = "Live Grep (search content)" })
keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { desc = "Find Buffers" })
keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { desc = "Find Help Tags" })
keymap.set('n', '<leader>fo', ':Telescope oldfiles<CR>', { desc = "Open Recent Files" })
keymap.set('n', '<leader>fs', ':Telescope grep_string<CR>', { desc = "Grep Word Under Cursor" })

-- Git related
keymap.set('n', '<leader>gg', ':Telescope git_files<CR>', { desc = "Find Git Files" })
keymap.set('n', '<leader>gc', ':Telescope git_commits<CR>', { desc = "Find Git Commits" })
keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', { desc = "Find Git Branches" })

-- LSP related (requires LSP to be set up)
keymap.set('n', '<leader>lr', ':Telescope lsp_references<CR>', { desc = "LSP References" })
keymap.set('n', '<leader>ls', ':Telescope lsp_document_symbols<CR>', { desc = "LSP Document Symbols" })
keymap.set('n', '<leader>lS', ':Telescope lsp_workspace_symbols<CR>', { desc = "LSP Workspace Symbols" })

-- Diagnostics
keymap.set('n', '<leader>dx', ':Telescope diagnostics<CR>', { desc = "Workspace Diagnostics" })
keymap.set('n', '<leader>dc', ':Telescope diagnostics bufnr=0<CR>', { desc = "Buffer Diagnostics" })

-- Other useful pickers
keymap.set('n', '<leader>fk', ':Telescope keymaps<CR>', { desc = "Show Keymaps" })
keymap.set('n', '<leader>co', ':Telescope colorscheme<CR>', { desc = "Select Colorscheme" })
keymap.set('n', '<leader>man', ':Telescope man_pages<CR>', { desc = "Man Pages" })


-- Commenting shortcut
keymap.set("x", "/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comments on selected lines" })
