return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local sorters = require("telescope.sorters")

        local function min_len_sorter(min_len)
            local s = sorters.get_fuzzy_file()
            s._was_discarded = function()
                return false
            end
            s.filter_function = function(_, prompt, _)
                if #prompt < min_len then
                    return -1, prompt
                end
                return 0, prompt
            end
            return s
        end

        telescope.setup({
            defaults = {
                file_sorter = function()
                    return min_len_sorter(3)
                end,
                preview = {
                    treesitter = false,
                },
            },
            pickers = {
                find_files = {
                    sorter = min_len_sorter(3),
                },
            },
        })

        vim.keymap.set("n", "<leader><leader>", function()
            builtin.find_files({
                sorter = min_len_sorter(3),
            })
        end, {})
        vim.keymap.set("n", "<leader>ff", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

        vim.keymap.set("n", "<leader>fi", function()
            builtin.grep_string({ search = vim.fn.input("Find > ") })
        end)
    end,
}
