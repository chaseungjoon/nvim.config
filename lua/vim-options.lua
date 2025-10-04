vim.cmd("set expandtab")
vim.o.winborder = 'rounded'
vim.cmd("set autoindent")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set number")
vim.cmd("set nocursorline")
vim.cmd("set backspace=indent,eol,start")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "utf-8"
vim.opt.scrolloff = 15
vim.opt.updatetime = 50

-- Keymap sets
vim.keymap.set("n", "<leader>w", ":close<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Popup/completion menu settings
vim.opt.pumblend = 0
vim.opt.winblend = 0
vim.opt.pumheight = 20                        
vim.opt.completeopt = "menu,menuone,noselect" 
