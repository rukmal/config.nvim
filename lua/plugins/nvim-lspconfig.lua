return {
    "neovim/nvim-lspconfig",
    opts = {
        inlay_hints = { enabled = true },
    },
    dependencies = {
        {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim"
            },
            opts = { lsp = { auto_attach = true } }
        }
    },
}
