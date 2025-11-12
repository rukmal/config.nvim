return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim"
  },
  opts = {
    window = {
      border = "single", -- "rounded", "double", "solid", "none"
      size = "90%",
      position = "50%",
      scrolloff = nil,
      sections = {
        left = {
          size = "20%",
          border = nil,
        },
        mid = {
          size = "20%",
          border = nil,
        },
        right = {
          border = nil,
          -- Set to "always" to show all detail possible as you requested
          preview = "always", -- Options: "leaf", "always" or "never"
        },
      },
    },
    lsp = { auto_attach = true }
  }
}
