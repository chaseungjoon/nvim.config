return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
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
