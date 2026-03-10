return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            model = "claude-opus-4.6",
            window = {
                layout = 'vertical',
                width = 0.35,
                border = 'rounded',
                title = 'Copilot Chat',
            },
            headers = {
                user = 'You',
                assistant = 'Copilot',
                tool = 'Tool',
            },
            auto_insert_mode = true,
            auto_fold = true,
        },
    },
}

