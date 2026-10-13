---@type LazySpec
return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
  -- which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        -- some which-key additions are in the area of their
        -- relevant plugin or autocmd
        { "<leader>t", group = "Telescope" },
        { "<leader>l", group = "Lazy", icon = "󰒲 " },
        { "<leader>s", group = "Snacks", icon = " " },
        { "<leader>b", group = "Buffer", icon = " " },
      })
    end,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer local keymaps (which-key)",
      },
    },
  },
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  -- tree-sitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    -- pin to old 0.11 compatible version until gentoo catches up
    commit = vim.fn.has("nvim-0.12") == 0 and "7caec274fd19c12b55902a5b795100d21531391f" or nil,
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "markdown_inline", "toml" },
      highlight = { enabled = true },
    },
  },
  -- snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
      dashboard = { enabled = true },
      animate = { enabled = true },
      picker = { enabled = true },
    },
  },
  -- colour preview
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("colorizer").setup()
    end,
  },
  -- nvim-tree explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    version = "*",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
  },
  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
  },
}
