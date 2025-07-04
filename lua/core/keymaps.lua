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

-- File exploration using built-in netrw (lightweight alternative)
keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
keymap.set("n", "<leader>E", ":Vexplore<CR>", { desc = "Open file explorer in vertical split" })


-- Telescope keymaps
-- Find files and grepping
keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = "Find Files" })
keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = "Live Grep (search content)" })
keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { desc = "Find Buffers" })
keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { desc = "Find Help Tags" })
keymap.set('n', '<leader>fo', ':Telescope oldfiles<CR>', { desc = "Open Recent Files" })
keymap.set('n', '<leader>fs', ':Telescope grep_string<CR>', { desc = "Grep Word Under Cursor" })

-- Removed Git and LSP related keymaps for lightweight setup
-- Focus on core file navigation for competitive programming

-- Other useful pickers
keymap.set('n', '<leader>fk', ':Telescope keymaps<CR>', { desc = "Show Keymaps" })
keymap.set('n', '<leader>co', ':Telescope colorscheme<CR>', { desc = "Select Colorscheme" })
keymap.set('n', '<leader>man', ':Telescope man_pages<CR>', { desc = "Man Pages" })


-- Commenting shortcuts are now handled in the Comment plugin config
-- Use <leader>/ for toggling comments in normal and visual mode

-- Competitive Programming shortcuts using CompetiTest
-- Primary workflow: Use CompetiTest for compilation, running, and testing

-- Main competitive programming commands using CompetiTest
keymap.set("n", "<leader>rr", ":CompetiTest run<CR>", { desc = "Run with CompetiTest (compile & test)" })
keymap.set("n", "<leader>rc", ":CompetiTest run<CR>", { desc = "Run with CompetiTest" })
keymap.set("n", "<leader>rn", ":CompetiTest run_no_compile<CR>", { desc = "Run without recompiling" })

-- Alternative: Direct execution for quick testing (fallback)
keymap.set("n", "<leader>rd", function()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand("%")
    local basename = vim.fn.expand("%:r")

    vim.cmd("w") -- Save file first

    if filetype == "cpp" then
        vim.cmd("!g++-15 -std=c++20 -O2 -Wall -Wextra " .. filename .. " -o " .. basename .. " && ./" .. basename)
    elseif filetype == "c" then
        vim.cmd("!gcc -std=c17 -O2 -Wall -Wextra " .. filename .. " -o " .. basename .. " && ./" .. basename)
    elseif filetype == "go" then
        vim.cmd("!go run " .. filename)
    elseif filetype == "rust" then
        vim.cmd("!rustc -O " .. filename .. " && ./" .. basename)
    elseif filetype == "python" then
        vim.cmd("!python3 " .. filename)
    else
        print("Unsupported file type for direct run: " .. filetype)
    end
end, { desc = "Direct compile and run (bypass CompetiTest)" })

-- Syntax checking only
keymap.set("n", "<leader>cc", ":w<CR>:!g++-15 -std=c++20 -O2 -Wall -Wextra -fsyntax-only %<CR>", { desc = "Check C++ syntax" })
keymap.set("n", "<leader>cb", ":w<CR>:!gcc -std=c17 -O2 -Wall -Wextra -fsyntax-only %<CR>", { desc = "Check C syntax" })
keymap.set("n", "<leader>cg", ":w<CR>:!go build %<CR>", { desc = "Build Go file" })
keymap.set("n", "<leader>cs", ":w<CR>:!rustc --check %<CR>", { desc = "Check Rust syntax" })

-- Quick template insertion for competitive programming
keymap.set("n", "<leader>tc", "i#include <bits/stdc++.h><CR>using namespace std;<CR><CR>int main() {<CR>ios_base::sync_with_stdio(false);<CR>cin.tie(NULL);<CR><CR>return 0;<CR>}<ESC>3kA", { desc = "Insert C++ template" })
keymap.set("n", "<leader>tg", "ipackage main<CR><CR>import \"fmt\"<CR><CR>func main() {<CR><CR>}<ESC>kA", { desc = "Insert Go template" })
keymap.set("n", "<leader>ts", "ifn main() {<CR><CR>}<ESC>kA", { desc = "Insert Rust template" })

-- CompetiTest workflow shortcuts
keymap.set("n", "<leader>ru", ":CompetiTest show_ui<CR>", { desc = "Show CompetiTest UI" })
keymap.set("n", "<leader>rt", ":CompetiTest receive testcases<CR>", { desc = "Receive testcases from browser" })
keymap.set("n", "<leader>rp", ":CompetiTest receive problem<CR>", { desc = "Receive problem from browser" })

-- Additional utilities
keymap.set("n", "<leader>rv", ":vsplit | terminal<CR>", { desc = "Open terminal in vertical split" })
keymap.set("n", "<leader>rh", ":split | terminal<CR>", { desc = "Open terminal in horizontal split" })

-- Direct input/output testing (for when not using CompetiTest)
keymap.set("n", "<leader>ri", function()
    local filename = vim.fn.expand("%:r")
    vim.cmd("w")
    vim.cmd("!" .. filename .. " < input.txt")
end, { desc = "Run with input.txt (direct)" })

keymap.set("n", "<leader>ro", function()
    local filename = vim.fn.expand("%:r")
    vim.cmd("w")
    vim.cmd("!" .. filename .. " < input.txt > output.txt")
end, { desc = "Run with input.txt → output.txt (direct)" })
