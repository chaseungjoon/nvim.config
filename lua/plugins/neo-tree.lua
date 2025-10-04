return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
        vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')
        vim.keymap.set('n', '<C-n>', '<Cmd>Neotree close<CR>')
        require("neo-tree").setup({
            window = {
                mappings = {
                    ["<CR>"] = "open",
                    ["<leader>v"] = "open_vsplit",
                    ["<leader>h"] = "open_split",
                }
            },
            git_status = { enable = false },
            filesystem = {
                filtered_items = {
                    hide_gitignored = false,
                    hide_dotfiles = false,
                    hide_by_name = {},
                    hide_by_pattern = {},
                },
                follow_current_file = {
                    enabled = true,
                },
            },
        })
    end
}
