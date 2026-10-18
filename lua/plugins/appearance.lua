---@type LazySpec
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = {
          statusline = { "snacks_dashboard", "dashboard", "alpha" },
        },
      },
    },
  },
  -- noice - cmdline
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufRead",
    config = function()
      vim.o.termguicolors = true
      require("bufferline").setup({
        options = {
          always_show_bufferline = false,
        },
      })
    end,
  },
  -- IDE-like breadcrumbs
  {
    "Bekaboo/dropbar.nvim",
    event = { "BufRead", "BufNewFile", "BufWrite" },
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("dropbar").setup({
        sources = {
          path = {
            max_depth = 4,
          },
        },
      })
      -- add icon to which-key
      require("which-key").add({
        { "<leader>;", icon = " " },
      })
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<leader>;", dropbar_api.pick, { desc = "Pick symbols in dropbar" })
      vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context." })
      vim.keymap.set("n", "];", dropbar_api.goto_context_start, { desc = "Select next context" })
    end,
  },
}
