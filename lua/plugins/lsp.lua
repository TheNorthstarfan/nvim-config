---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "lua_ls",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  -- conform - formatters
  {
    "stevearc/conform.nvim",
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = function(bufnr)
        local filetype = vim.bo[bufnr].filetype
        if filetype == "c" or filetype == "cpp" or filetype == "headers" then
          return -- no autoformat
        end

        return { timeout_ms = 500 }
      end,
      formatters = {
        -- add formatting opts here
      },
    },
  },
}
