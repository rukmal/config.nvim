return {
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = { { "<leader>cs", "<cmd>Outline<cr>", desc = "Outline" } },
    opts = {
      providers = {
        -- Use markdown provider for quarto (same as .md); LSP often returns no symbols for .qmd
        markdown = {
          filetypes = { "markdown", "quarto" },
        },
        lsp = {
          -- Blacklist LSPs that attach to quarto but return no document symbols,
          -- so outline falls back to the markdown provider (heading parsing)
          blacklist_clients = { "quartols", "marksman" },
        },
      },
    },
  },
}
