return {
    "xiyaowong/transparent.nvim",
    name = "transparent",
    lazy = false,
    priority = 1000,
    config = function()
        require("transparent").setup({
            groups = {
                'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                'EndOfBuffer',
            },
            extra_groups = {
                'NeoTreeNormal',
                'NeoTreeNormalNC',
                'NeoTreeEndOfBuffer'
            },
            exclude_groups = {},
            on_clear = function() end,
        })
    end
}
