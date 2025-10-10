return {
    {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function()
            local map = vim.api.nvim_set_keymap

            map('i', '<TAB>', 'pumvisible() ? coc#_select_confirm() : "\\<TAB>"', { expr = true, noremap = true })
            map('i', '<S-TAB>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', { expr = true, noremap = true })

            map('n', 'gd', '<Plug>(coc-definition)', {})
            map('n', 'K', ':call CocActionAsync("doHover")<CR>', {})
            map('n', '<leader>rn', '<Plug>(coc-rename)', {})

            vim.g.coc_enable_float_preview = false
            vim.g.coc_hover_target = 'float'
            vim.g.coc_signature_float_enable = false
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = { "*.py", "*.c", "*.h", "*.lua", "*.rs" },
                callback = function()
                    local ft = vim.bo.filetype
                    if ft == "python" then
                        vim.cmd("silent! CocCommand python.sortImports")
                        vim.cmd("silent! CocCommand editor.action.formatDocument")
                    elseif ft == "c" or ft == "cpp" or ft == "lua" or ft == "rust" then
                        vim.cmd("silent! CocCommand editor.action.formatDocument")
                    end
                end,
            })
        end
    }
}
