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
    ---@module 'which-key'
    ---@type wk.Opts
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
        { "<leader>b", group = "Buffer", icon = "󰓩 " },
        { "<leader>M", icon = "󰒋 " },
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
    main = "nvim-treesitter",
    -- pin to old 0.11 compatible version until gentoo catches up
    commit = vim.fn.has("nvim-0.12") == 0 and "7caec274fd19c12b55902a5b795100d21531391f" or nil,
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "markdown_inline", "toml", "html" },
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
    "catgoose/nvim-colorizer.lua",
    event = { "BufRead", "BufNewFile" },
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
      ---@module 'nvim-tree'
      ---@type nvim_tree.config
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
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
  -- comment toggling
  {
    "numToStr/Comment.nvim",
    opts = {},
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Toggle Comment line" },
      { "gb", mode = { "n", "v" }, desc = "Toggle Comment block" },
    },
  },
  -- images
  {
    "3rd/image.nvim",
    build = false,
    ft = { "html", "markdown", "neorg" },
    opts = {
      processor = "magick_cli",
    },
  },
  -- flash.nvim
  {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {},
    event = { "BufRead", "BufNewFile" },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  -- treesitter texobjects - yank in function and whatnot
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local select = require("nvim-treesitter-textobjects.select")

      vim.keymap.set({ "x", "o" }, "if", function()
        select.select_textobject("@function.inner")
      end, { desc = "Inner function" })
      vim.keymap.set({ "x", "o" }, "af", function()
        select.select_textobject("@function.outer")
      end, { desc = "Inner function" })
      vim.keymap.set({ "x", "o" }, "ic", function()
        select.select_textobject("@class.inner")
      end, { desc = "Inner function" })
      vim.keymap.set({ "x", "o" }, "ac", function()
        select.select_textobject("@class.outer")
      end, { desc = "Inner function" })
    end,
  },
}
