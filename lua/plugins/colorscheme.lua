return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = {
            style = "night",
            transparent = true,
            styles = {
                -- sidebars = "transparent",
                -- floats = "transparent"
            },
            on_colors = function(colors)
                colors.border = "#608CFF"
            end
        },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_background = true,
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
            },
            custom_highlights = function(colors)
                return {
                    VertSplit = { fg = "#608CFF" }, -- For vertical split borders
                    StatusLine = { bg = "#608CFF" }, -- For active window status line (horizontal split border)
                    StatusLineNC = { bg = "#608CFF" } -- For non-active window status lines (horizontal split border)
                }
            end,
        },
        lazy = false
    },
    {
        'uloco/bluloco.nvim',
        lazy = false,
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
        config = function()
            -- your optional config goes here, see below.
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-mocha"
        }
    }
}
