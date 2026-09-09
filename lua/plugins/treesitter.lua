return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        ts.setup()

        ts.install({
            "python", "c", "cpp", "rust", "lua", "gitignore",
            "markdown", "markdown_inline",
            -- diff: git diff / conflict highlighting
            -- html/latex/yaml: render-markdown.nvim
            "diff", "html", "latex", "yaml",
        })

        -- The `main` branch ships no modules, so highlighting and indenting are
        -- started per buffer.
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
            callback = function(args)
                if not pcall(vim.treesitter.start, args.buf) then
                    return
                end
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
