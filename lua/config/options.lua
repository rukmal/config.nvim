-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Tab/Indent settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smarttab = true

-- Search settings
vim.opt.smartindent = false -- causes indentation issues w/ closing bracket

-- Syntax/Display settings
vim.cmd.syntax = "enable"
vim.opt.conceallevel = 0 -- Set conceallevel to 0

-- Window/Line settings
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.wo.relativenumber = true
-- Merge the sign column and the number column into one
vim.opt.signcolumn = "number"
-- Narrow the column
vim.opt.numberwidth = 1
-- Remove the fold column (the space to the left of the number)
vim.opt.foldcolumn = "0"

-- Global variables
vim.g.autoformat = false -- Disable lsp autoformat
vim.g.have_nerd_font = true -- Set nerd font to true
