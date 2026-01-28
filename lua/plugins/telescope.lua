return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { 
                "nvim-telescope/telescope-live-grep-args.nvim" ,
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
        },
        keys = {
            {
                "<leader>j",
                function()
                    require("telescope.builtin").lsp_document_symbols()
                end,
                desc = "Document Symbols",
            },
            {
                "<leader>J",
                function()
                    require("telescope.builtin").lsp_workspace_symbols()
                end,
                desc = "Workspace Symbols",
            },
        },
        opts = {
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-h>"] = "which_key"
                    }
                }
            },
            pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
            },
            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
            }
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }
}
