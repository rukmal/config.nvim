return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require("cmp")
            cmp.setup({
                mapping = {
                    --["<CR>"] = cmp.mapping.confirm({
                    --    select = true,
                    --    behavior = cmp.ConfirmBehavior.Replace,
                    --}),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
            })
            opts.snippet = vim.tbl_extend("force", opts.snippet, {
                expand = function() end,
            })
            -- opts.mapping = vim.tbl_extend("force", opts.mapping, {
            -- 	["<CR>"] = cmp.mapping.confirm({
            -- 		select = true,
            -- 		behavior = cmp.ConfirmBehavior.Replace,
            -- 	}),
            -- })
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
--                { name = "ballerina-lsp", priority = 100 },
                { name = "copilot" }
            }))
        end,
    }
}

