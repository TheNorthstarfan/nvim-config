---@type LazySpec
return {
  {
    "catppuccin/nvim",
    name = "Catppuccin",
    lazy = false,
    ---@module "catppuccin"
    ---@type CatppuccinOptions
    opts = {
      flavour = "mocha",
      no_italic = false,
    },
    config = function()
      vim.cmd("colorscheme catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    event = "VeryLazy",
  },
}
