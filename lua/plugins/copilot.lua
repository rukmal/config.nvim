return {
	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				["*"] = true,
			},
			telemetry = {
                telemetryLevel = "none", -- Disable telemetry
            },
		},
	},
	-- copilot cmp source
	{
		"nvim-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				dependencies = "copilot.lua",
				config = function(_, opts)
					local copilot_cmp = require("copilot_cmp")
					copilot_cmp.setup(opts)
					-- attach cmp source whenever copilot attaches
					-- fixes lazy-loading issues with the copilot cmp source
					require("lazyvim.util").lsp.on_attach(function(client)
						if client.name == "copilot" then
							copilot_cmp._on_insert_enter()
						end
					end)
				end,
			},
		},
		-----@param opts cmp.ConfigSchema
		-- opts = function(_, opts)
		-- 	local cmp = require("cmp")
		-- 	opts.snippet = vim.tbl_extend("force", opts.snippet, {
		-- 		expand = function() end,
		-- 	})
		-- 	-- opts.mapping = vim.tbl_extend("force", opts.mapping, {
		-- 	-- 	["<CR>"] = cmp.mapping.confirm({
		-- 	-- 		select = true,
		-- 	-- 		behavior = cmp.ConfirmBehavior.Replace,
		-- 	-- 	}),
		-- 	-- })
		-- 	opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" } }))
		-- end,
	},
}
