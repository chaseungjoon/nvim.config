return {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    opts = {
        style = "night",
        transparent = true,
        terminal_colors = true,
        styles = { sidebars = "transparent", floats = "transparent" },
    },
    config = function()
        vim.cmd.colorscheme "tokyonight"
    end
}
