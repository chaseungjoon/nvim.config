return {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "py" },
    root_markers = { ".git", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt" },
}
