local term_buf = nil
local term_win = nil

function _G.toggle_bottom_terminal()
    if term_win and vim.api.nvim_win_is_valid(term_win) then
        vim.api.nvim_win_close(term_win, true)
        term_win = nil
        return
    end

    vim.cmd("belowright split")
    term_win = vim.api.nvim_get_current_win()

    vim.api.nvim_win_set_height(term_win, 25)

    term_buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(term_win, term_buf)

    vim.fn.termopen(vim.o.shell, { buf = term_buf })

    vim.cmd("startinsert")
end

vim.api.nvim_set_keymap('n', '<C-j>', ':lua toggle_bottom_terminal()<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n>:lua toggle_bottom_terminal()<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-w><C-w>', [[<C-\><C-n><C-w>w]], { noremap = true, silent = true })
vim.keymap.set('t', '<C-b>',
    [[<C-\><C-n>:lua require('neo-tree.command').execute({ toggle = true, position = 'left' })<CR>]],
    { noremap = true, silent = true })
vim.keymap.set('t', '<C-n>', [[<C-\><C-n>:lua require('neo-tree.command').execute({ action = "close" })<CR>]],
    { noremap = true, silent = true })
