return {
  "marko-cerovac/material.nvim",
  "olimorris/onedarkpro.nvim",
  "shaunsingh/nord.nvim",
  "sainnhe/everforest",
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
  "catppuccin/nvim",
  "rebelot/kanagawa.nvim",
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "nord",
  --   },
  -- },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").load()
    end,
  },
}
