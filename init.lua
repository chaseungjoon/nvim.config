--Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- `vim.F.if_nil` is deprecated in 0.15, but several plugins (alpha-nvim,
-- plenary) still bind it at load time. Alias it to the replacement up front so
-- they never hit the deprecation path.
vim.F.if_nil = vim.nonnil
vim.F.npcall = vim.npcall

-- PATH: user-local binaries plus the platform's TeX distribution.
local path_dirs = { vim.env.HOME .. "/.local/bin" }
if vim.uv.os_uname().sysname == "Darwin" then
    table.insert(path_dirs, "/Library/TeX/texbin")
    table.insert(path_dirs, "/opt/homebrew/bin")
else
    table.insert(path_dirs, vim.env.HOME .. "/.TinyTeX/bin/x86_64-linux")
end
for _, dir in ipairs(path_dirs) do
    if vim.uv.fs_stat(dir) and not vim.env.PATH:find(dir, 1, true) then
        vim.env.PATH = dir .. ":" .. vim.env.PATH
    end
end

-- Dedicated virtualenv for the Python provider, so it does not depend on
-- whatever `python3` happens to resolve to (see :checkhealth vim.provider).
local py3 = vim.fn.stdpath("data") .. "/py3nvim/bin/python"
if vim.uv.fs_stat(py3) then
    vim.g.python3_host_prog = py3
end

-- lazy.nvim resets 'runtimepath', which on distro builds (Ubuntu ships them
-- under /usr/lib/<triple>/nvim) drops the directory holding Neovim's own
-- bundled treesitter parsers. Capture those dirs while the rtp is still
-- pristine and hand them back to lazy.
local bundled_rtp = {}
for _, dir in ipairs(vim.api.nvim_get_runtime_file("parser", true)) do
    table.insert(bundled_rtp, vim.fs.dirname(dir))
end

require("vim-options")
require("lazy").setup("plugins", {
    rocks = { enabled = false },
    performance = { rtp = { paths = bundled_rtp } },
})
require("terminal")
