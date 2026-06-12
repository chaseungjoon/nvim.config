return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    init = function()
        require("nvim-treesitter.install").prefer_git = true
    end,
    config = function()
        local ts = require("nvim-treesitter")
        ts.install({ "python", "c", "cpp", "lua", "markdown", "markdown_inline" })
    end
}
