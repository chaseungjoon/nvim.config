return {
    "lervag/vimtex",
    lazy = false,
    ft = { "tex" },
    init = function()
        if vim.uv.os_uname().sysname == "Darwin" then
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_view_skim_sync = 1
            vim.g.vimtex_view_skim_activate = 1
        elseif vim.fn.executable("zathura") == 1 then
            vim.g.vimtex_view_method = "zathura"
        else
            -- No SyncTeX forward search, but still opens the PDF.
            vim.g.vimtex_view_method = "general"
            vim.g.vimtex_view_general_viewer = "xdg-open"
        end

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
        -- No `vimtex_compiler_progname`: nvim's built-in --server handles the
        -- latexmk callback, and hardcoding `nvr` breaks it when nvr is absent.
    end,
    config = function()

    end
}
