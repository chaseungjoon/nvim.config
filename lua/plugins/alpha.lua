return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }
        -- Header Color
        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#FF6B00", bold = true })
        dashboard.section.header.opts.hl = "AlphaHeader"

        -- Buttons
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":cd ~/.config/nvim | Neotree toggle<CR>"),
            dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }

        -- Footers
        local function get_current_time()
            return os.date("%Y/%m/%d %H:%M")
        end

        local function get_user_host()
            return os.getenv("USER") .. "@" .. vim.fn.hostname()
        end
        local function get_system_info()
            local arch   = vim.fn.system("uname -m"):gsub("%s+$", "")
            local cpu    = vim.fn.system("sysctl -n machdep.cpu.brand_string"):gsub("%s+$", "")
            local osver = vim.fn.system("sw_vers -productVersion"):gsub("%s+$", "")

            return string.format("       %s  %s  macOS %s", cpu, arch, osver)
        end

        local flines = {"", "","", "", "","", get_user_host(), get_system_info(),"" , "              " .. get_current_time() }
        dashboard.section.footer.val = flines
        dashboard.section.footer.opts.hl = "Comment"

        alpha.setup(dashboard.opts)
    end,
}
