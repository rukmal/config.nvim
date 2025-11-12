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
        -- 1. Enable transparency for ALL flavors by default.
        -- This will make mocha (and others) transparent.
        transparent_background = false,
        flavour = "mocha", -- Your default flavor
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
        -- We can remove the custom_highlights function, as highlight_overrides
        -- is more powerful and handles this better.
        highlight_overrides = {
            -- 'all' applies to every flavor
            all = {
                VertSplit = { fg = "#608CFF" },
                StatusLine = { fg = "#FFFFFF", bg = "#608CFF" },
                StatusLineNC = { fg = "#FFFFFF", bg = "#608CFF" },
            },
            -- 'mocha' applies ONLY when mocha is active
            mocha = {
                -- Your existing overrides to make floats opaque in mocha
                NormalFloat = { bg = "#1E1E2E" },
                FloatBorder = { bg = "#1E1E2E", fg = "#608CFF" },
            },
            -- 2. 'latte' applies ONLY when latte is active
            latte = {
                -- 3. HERE IS THE FIX: We override the 'Normal' group
                -- to give it an opaque background color, overriding the
                -- global transparent_background setting.

                -- Use '#e6e9ef' (Mantle) for an "off-white slightly darker" feel
                Normal = { bg = "#e6e9ef" },
                -- You can also use '#eff1f5' (Base) if you just want
                -- the default opaque latte background.
                -- Normal = { bg = "#eff1f5" }, 
                -- 4. Also make sure floats are opaque for latte
                NormalFloat = { bg = "#e6e9ef" },
                FloatBorder = { bg = "#e6e9ef", fg = "#608CFF" },
                -- You may need to add other groups here if they
                -- still appear transparent, e.g.:
                -- NvimTreeNormal = { bg = "#e6e9ef" },
            }
        }
    },
    lazy = false,
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
