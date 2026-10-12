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
  end,
})
