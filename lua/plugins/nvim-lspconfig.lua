return {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
        -- { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
        "mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        {
            "SmiteshP/nvim-navbuddy",
            dependencies = {
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim"
            },
            opts = { lsp = { auto_attach = true } }
        }
    },
    opts = {
        inlay_hints = { enabled = true },
    },
    config = function()
    end,
}
