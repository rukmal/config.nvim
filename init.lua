if vim.g.vscode then
	-- VSCode extension
else
	-- bootstrap lazy.nvim, LazyVim and your plugins
	require("config.lazy")

	-- require("copilot").setup({
	-- 	suggestion = { enabled = false },
	-- 	panel = { enabled = false },
	-- 	filetypes = {
	-- 		["*"] = true,
	-- 		["md"] = true
	-- 	},
	-- })
	require("leap").add_default_mappings()
	vim.filetype.add({
		extension = {
			bal = "ballerina",
		},
	})
	vim.filetype.add({
		extension = {
			py = "python",
		},
	})
	vim.filetype.add({
		extension = {
			proto = "proto",
		},
	})

	-- Need function to check if a current LSP is running (if so return ID)
	-- If true, attach the current buffer (in filetype autocmd) to the client ID
	-- If the result of that function is false (i.e. the LSP isn't running yet), start it
	local get_lsp_id = function(lsp_name)
		print(vim.lsp)
		if vim.lsp.get_clients == nil then
			return nil
		end
		for _, client in ipairs(vim.lsp.get_clients()) do
			if client.name == lsp_name then
				return client.id
			end
		end
		return nil
	end

	local get_new_lsp_id = function()
		if vim.lsp.get_clients == nil then
			return 1
		end
		return #vim.lsp.get_clients() + 1 -- Client IDs start at 1
	end

	local lsp = require("lspconfig")

	local python_root_files = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	}

	--    vim.lsp.start({
	--        name = "ballerina-ls",
	--        cmd = { "bal", "start-language-server" },
	--        pattern = { "ballerina" },
	--        root_dir = vim.fs.dirname(vim.fs.find({ "Ballerina.toml" }, { upward = true })[1]),
	--        autostart = true,
	--    })

	--    vim.tbl_deep_extend('keep', lsp, {
	--        ballerina_ls = {
	--            cmd = { "bal", "start-language-server" },
	--            filetypes = "bal",
	--            name = "ballerina_ls",
	--        }
	--    })
	--    vim.lsp.start({
	--        name = "pyright-lsp",
	--        cmd = { "pyright-langserver", "--stdio" },
	--        pattern = { "python" },
	--        filetypes = {"python"},
	--        root_dir = vim.fs.dirname(vim.fs.find(python_root_files, { upward = true })[1]),
	--        single_file_support = true,
	--        settings = {
	--            python = {
	--                analysis = {
	--                    autoSearchPaths = true,
	--                    useLibraryCodeForTypes = true,
	--                    diagnosticMode = 'openFilesOnly',
	--                },
	--            },
	--        },
	--        autostart = true,
	--    })
	--
	--
	lsp.pyright.setup({})
	-- lsp.ballerina_ls.setup({})

	--local
	--
	--
	--    vim.lsp.start({
	--        name = "pyright-lsp",
	--        cmd = { "pyright-langserver", "--stdio" },
	--        pattern = { "python" },
	--        filetypes = {"python"},
	--        root_dir = vim.fs.dirname(vim.fs.find(python_root_files, { upward = true })[1]),
	--        single_file_support = true,
	--        settings = {
	--            python = {
	--                analysis = {
	--                    autoSearchPaths = true,
	--                    useLibraryCodeForTypes = true,
	--                    diagnosticMode = 'openFilesOnly',
	--                },
	--            },
	--        },
	--        autostart = true,
	--    })
	--    local python_lsp_group = vim.api.nvim_create_augroup("python_lsp", { clear = true })
	--    vim.api.nvim_create_autocmd("FileType", {
	--        pattern = { "python" },
	--        callback = function()
	--            -- Check if LSP is running yet
	--            local existing_lsp_id = get_lsp_id("pyright-lsp")
	--            -- If it isn't running yet, start it
	--            if existing_lsp_id == nil then
	--                -- Get the ID of the new LSP so we can attach it to the buffer
	--                existing_lsp_id = get_new_lsp_id()
	--                vim.lsp.start({
	--                    name = "pyright-lsp",
	--                    cmd = { "pyright-langserver", "--stdio" },
	--                    pattern = { "python" },
	--                    filetypes = {"python"},
	--                    root_dir = vim.fs.dirname(vim.fs.find(python_root_files, { upward = true })[1]),
	--                    single_file_support = true,
	--                    settings = {
	--                        python = {
	--                            analysis = {
	--                                autoSearchPaths = true,
	--                                useLibraryCodeForTypes = true,
	--                                diagnosticMode = 'openFilesOnly',
	--                            },
	--                        },
	--                    },
	--                    autostart = true,
	--                })
	--            end
	--            -- Attach the current buffer to the client
	--            vim.lsp.buf_attach_client(0, existing_lsp_id)
	--        end,
	--        group = python_lsp_group,
	--    })
	--
	--    local lua_lsp_group = vim.api.nvim_create_augroup("lua_lsp", { clear = true })
	--    vim.api.nvim_create_autocmd("FileType", {
	--        pattern = { "lua" },
	--        callback = function()
	--            -- Check if LSP is running yet
	--            local existing_lsp_id = get_lsp_id("lua_ls")
	--            if existing_lsp_id == nil then
	--                existing_lsp_id = 1
	--            end
	--            vim.lsp.buf_attach_client(0, existing_lsp_id)
	--        end,
	--        group = lua_lsp_group,
	--    })
	--
	local bal_lsp_group = vim.api.nvim_create_augroup("ballerina-lsp", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "ballerina" },
		callback = function()
			--            -- Check if LSP is running yet
			--            local existing_lsp_id = get_lsp_id("ballerina-lsp")
			--            -- If it isn't running yet, start it
			--            if existing_lsp_id == nil then
			--                -- Get the ID of the new LSP so we can attach it to the buffer
			--                existing_lsp_id = get_new_lsp_id()
			local lsp_id = vim.lsp.start({
				name = "ballerina-lsp",
				cmd = { "bal", "start-language-server" },
				pattern = { "ballerina" },
				filetypes = { "ballerina" },
				root_dir = vim.fs.dirname(vim.fs.find({ "Ballerina.toml" }, { upward = true })[1]),
				autostart = true,
			})
			--            end
			if lsp_id == nil then
				lsp_id = 1
			end
			vim.lsp.buf_attach_client(0, lsp_id)
		end,
		group = bal_lsp_group,
	})
	vim.opt.shiftwidth = 4
	vim.opt.tabstop = 4
	-- vim.opt.softtabstop = 4
	vim.opt.expandtab = true -- Use spaces instead of tabs
	vim.opt.smarttab = true
	-- vim.opt.autoindent = false
	vim.opt.smartindent = false -- causes indentation issues w/ closing bracket
	vim.cmd.syntax = "enable"
	vim.wo.wrap = true
	vim.wo.linebreak = true
	vim.wo.breakindent = true
	vim.wo.relativenumber = true
	-- Disable lsp autoformat
	vim.g.autoformat = false
	-- local rainbow_delimiters = require("rainbow-delimiters")
	-- vim.g.rainbow_delimiters = {
	-- 	strategy = {
	-- 		[""] = rainbow_delimiters.strategy["global"],
	-- 		commonlisp = rainbow_delimiters.strategy["local"],
	-- 	},
	-- 	query = {
	-- 		[""] = "rainbow-delimiters",
	-- 		lua = "rainbow-blocks",
	-- 	},
	-- 	highlight = {
	-- 		"RainbowDelimiterRed",
	-- 		"RainbowDelimiterYellow",
	-- 		"RainbowDelimiterBlue",
	-- 		"RainbowDelimiterOrange",
	-- 		"RainbowDelimiterGreen",
	-- 		"RainbowDelimiterViolet",
	-- 		"RainbowDelimiterCyan",
	-- 	},
	-- 	blacklist = { "c", "cpp" },
	-- }
	-- Keybindings for jumping up/down half a page
	-- See: https://youtu.be/KfENDDEpCsI?si=VOCbh9MPDrjyW-Me&t=203
	vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half a page" })
	vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half a page" })

	-- Keybindings for Telescope
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find in files" })
	vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })

	-- Keybinding to close the current buffer, without closing the window
	-- Ref: https://www.reddit.com/r/neovim/comments/s4jt9n/how_to_close_the_current_buffer_without_closing/hthdeqz/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
	vim.keymap.set(
		"n",
		"<leader>bd",
		":<C-U>bprevious <bar> bdelete #<CR>",
		{ noremap = true, silent = true, desc = "Close buffer (not window)" }
	)

	-- Keybindings for moving lines up/down
	-- (alt is A)
	vim.keymap.set({ "n", "v" }, "<A-j>", ":m .+1<CR>==", { desc = "Move line up" }) -- move line up
	vim.keymap.set({ "n", "v" }, "<A-k>", ":m .-2<CR>==", { desc = "Move line down" }) -- move line down

	-- Keybindings to launch NavBuddy
	vim.keymap.set("n", "<leader>n", ":Navbuddy<CR>", { desc = "Launch NavBuddy symbol navigator" })
end
