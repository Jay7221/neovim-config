return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- Use gcc for line comments and gbc for block comments (default)
        -- Or customize with different keys
        toggler = {
            line = 'gcc',  -- Line-comment toggle keymap
            block = 'gbc', -- Block-comment toggle keymap
        },
        opleader = {
            line = 'gc',   -- Line-comment keymap
            block = 'gb',  -- Block-comment keymap
        },
    },
    config = function(_, opts)
        require("Comment").setup(opts)

        -- Add a custom keymap for Ctrl+/ equivalent using a key that works
        -- Using <leader>/ as an alternative since Ctrl+/ doesn't work reliably
        vim.keymap.set("n", "<leader>/", function()
            require("Comment.api").toggle.linewise.current()
        end, { desc = "Toggle comment" })

        vim.keymap.set("v", "<leader>/", function()
            local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
            vim.api.nvim_feedkeys(esc, 'nx', false)
            require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end, { desc = "Toggle comment" })
    end,
}
