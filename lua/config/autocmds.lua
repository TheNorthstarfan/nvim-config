local lua_indent_group = vim.api.nvim_create_augroup("LuaIndent", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  group = lua_indent_group,
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true

    vim.keymap.set("n", "<leader>S", "<cmd>so<cr>", { noremap = true, silent = true, desc = "Source file" })
  end,
})
--
-- man item under cursor in C and shell files
autocmd("FileType", {
  pattern = { "c", "sh", "bash" },
  callback = function()
    vim.keymap.set("n", "<leader>K", function()
      vim.cmd("Man " .. vim.fn.expand("<cword>"))
    end, { desc = "Open manpage", noremap = true })
    require("which-key").add({
      { "<leader>K", icon = " " },
    })
  end,
})

-- stop CSS from treating universal rules (*) as multiline comments
autocmd("FileType", {
  pattern = "css",
  callback = function()
    -- stop `*` from being seen as a comment
    vim.bo.comments = "s1:/*,mb:*,ex:*/"
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})
