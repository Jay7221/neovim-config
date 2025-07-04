return {
	'xeluxee/competitest.nvim', dependencies = 'MunifTanjim/nui.nvim',
    opts = {
        local_config_file_name = ".competitest.lua",

        floating_border = "rounded",
        floating_border_highlight = "FloatBorder",
        picker_ui = {
            width = 0.2,
            height = 0.3,
            mappings = {
                focus_next = { "j", "<down>", "<Tab>" },
                focus_prev = { "k", "<up>", "<S-Tab>" },
                close = { "<esc>", "<C-c>", "q", "Q" },
                submit = "<cr>",
            },
        },
        editor_ui = {
            popup_width = 0.4,
            popup_height = 0.6,
            show_nu = true,
            show_rnu = false,
            normal_mode_mappings = {
                switch_window = { "<C-h>", "<C-l>", "<C-i>" },
                save_and_close = "<C-s>",
                cancel = { "q", "Q" },
            },
            insert_mode_mappings = {
                switch_window = { "<C-h>", "<C-l>", "<C-i>" },
                save_and_close = "<C-s>",
                cancel = "<C-q>",
            },
        },
        runner_ui = {
            interface = "popup",
            selector_show_nu = false,
            selector_show_rnu = false,
            show_nu = true,
            show_rnu = false,
            mappings = {
                run_again = "R",
                run_all_again = "<C-r>",
                kill = "K",
                kill_all = "<C-k>",
                view_input = { "i", "I" },
                view_output = { "a", "A" },
                view_stdout = { "o", "O" },
                view_stderr = { "e", "E" },
                toggle_diff = { "d", "D" },
                close = { "q", "Q" },
            },
            viewer = {
                width = 0.5,
                height = 0.5,
                show_nu = true,
                show_rnu = false,
                open_when_compilation_fails = true,
            },
        },
        popup_ui = {
            total_width = 0.8,
            total_height = 0.8,
            layout = {
                { 4, "tc" },
                { 5, { { 1, "so" }, { 1, "si" } } },
                { 5, { { 1, "eo" }, { 1, "se" } } },
            },
        },
        split_ui = {
            position = "right",
            relative_to_editor = true,
            total_width = 0.3,
            vertical_layout = {
                { 1, "tc" },
                { 1, { { 1, "so" }, { 1, "eo" } } },
                { 1, { { 1, "si" }, { 1, "se" } } },
            },
            total_height = 0.4,
            horizontal_layout = {
                { 2, "tc" },
                { 3, { { 1, "so" }, { 1, "si" } } },
                { 3, { { 1, "eo" }, { 1, "se" } } },
            },
        },

        save_current_file = true,
        save_all_files = false,
        compile_directory = ".",
        compile_command = {
            c = { exec = "gcc", args = { "-Wall", "-Wextra", "-std=c17", "-O2", "$(FNAME)", "-o", "$(FNOEXT)" } },
            cpp = { exec = "g++-15", args = { "-Wall", "-Wextra", "-std=c++20", "-O2", "$(FNAME)", "-o", "$(FNOEXT)" } },
            go = { exec = "go", args = { "build", "-o", "$(FNOEXT)", "$(FNAME)" } },
            rust = { exec = "rustc", args = { "-O", "$(FNAME)" } },
        },
        running_directory = ".",
        run_command = {
            c = { exec = "./$(FNOEXT)" },
            cpp = { exec = "./$(FNOEXT)" },
            go = { exec = "./$(FNOEXT)" },
            rust = { exec = "./$(FNOEXT)" },
        },
        multiple_testing = -1,
        maximum_time = 5000,
        output_compare_method = "squish",
        view_output_diff = false,

        testcases_directory = ".",
        testcases_use_single_file = false,
        testcases_auto_detect_storage = true,
        testcases_single_file_format = "$(FNOEXT).testcases",
        testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
        testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",

        companion_port = 27121,
        receive_print_message = true,
        start_receiving_persistently_on_setup = false,
        template_file = false,
        evaluate_template_modifiers = false,
        date_format = "%c",
        received_files_extension = "cpp", -- Default to C++ for competitive programming
        received_problems_path = "$(CWD)/$(PROBLEM).$(FEXT)",
        received_problems_prompt_path = true,
        received_contests_directory = "$(CWD)",
        received_contests_problems_path = "$(PROBLEM).$(FEXT)",
        received_contests_prompt_directory = true,
        received_contests_prompt_extension = true,
        open_received_problems = true,
        open_received_contests = true,
        replace_received_testcases = false,
    },
    config = function(_, opts)
    -- This ensures CompetiTest is set up with your options
    require("competitest").setup(opts)

    -- CompetiTest keymaps using <leader>t prefix (t for Test)
    vim.keymap.set("n", "<leader>ta", ":CompetiTest add_testcase<CR>", { desc = "Add Testcase" })
    vim.keymap.set("n", "<leader>te", ":CompetiTest edit_testcase<CR>", { desc = "Edit Testcase" })
    vim.keymap.set("n", "<leader>td", ":CompetiTest delete_testcase<CR>", { desc = "Delete Testcase" })
    vim.keymap.set("n", "<leader>tr", ":CompetiTest run<CR>", { desc = "Run Testcases" })
    vim.keymap.set("n", "<leader>tu", ":CompetiTest show_ui<CR>", { desc = "Show CompetiTest UI" })
    vim.keymap.set("n", "<leader>tn", ":CompetiTest run_no_compile<CR>", { desc = "Run Testcases (No Compile)" })
    vim.keymap.set("n", "<leader>tf", ":CompetiTest convert<CR>", { desc = "Convert Testcases File" })

    -- Additional competitive programming utilities
    vim.keymap.set("n", "<leader>tt", ":CompetiTest receive testcases<CR>", { desc = "Receive Testcases from Browser" })
    vim.keymap.set("n", "<leader>tp", ":CompetiTest receive problem<CR>", { desc = "Receive Problem from Browser" })
    end,
}
