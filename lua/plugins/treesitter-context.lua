return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = "VeryLazy",
  opts = {
    enable = true,
    max_lines = 3, -- or 0 for no limit
    trim_scope = "outer",
    mode = "cursor", -- or 'topline'
    zindex = 20,
  },
}
