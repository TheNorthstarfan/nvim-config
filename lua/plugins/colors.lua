-- Set unused colorschemes in this file to `event = "VeryLazy"`
-- Gonna set the actual colourscheme itself in options.lua from now on.
---@type LazySpec
return {
  {
    "catppuccin/nvim",
    name = "Catppuccin",
    ---@module "catppuccin"
    ---@type CatppuccinOptions
    opts = {
      flavour = "mocha",
      no_italic = false,
    },
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    build = false,
  },
}
