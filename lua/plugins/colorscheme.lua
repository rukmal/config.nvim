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
        "LazyVim/LazyVim",
        colorscheme = "kanagawa-wave"
    }
}
