return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim', },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                -- Routes vim.ui.select through telescope instead of the
                -- built-in prompt.
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })
        telescope.load_extension("ui-select")

        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<C-p>', function()
            builtin.find_files({
                no_ignore = true,
                hidden = true,
            })
        end, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
}
