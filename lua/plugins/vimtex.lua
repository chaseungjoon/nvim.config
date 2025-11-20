return {
    "lervag/vimtex",
    lazy = false,
    ft = { "tex" },
    init = function()
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1

        vim.g.vimtex_compiler_method = "latexmk"

        vim.g.vimtex_compiler_latexmk = {
            build_dir = "",
            callback = 1,
            continuous = 1,
            executable = "latexmk",
            options = {
                "-pdf",
                "-interaction=nonstopmode",
                "-synctex=1",
            },
        }

        vim.g.vimtex_compiler_progname = "nvr"
    end,
    config = function()

    end
}
