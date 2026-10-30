vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- set colourscheme here
vim.cmd.colorscheme("catppuccin")

-- both number and relativenumber for good relative scrolling
vim.o.number = true
vim.o.relativenumber = true
-- highlight cursor line
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

vim.o.scrolloff = 8

vim.o.wrap = true

vim.o.confirm = true

-- ignore case in searching
vim.o.ignorecase = true

vim.cmd("syntax on")

-- set clipboard properly for WSL
local is_wsl = (vim.fn.has("unix") == 1) and vim.fn.system("uname -r"):lower():match("microsoft")
if is_wsl then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "/mnt/c/tools/win32yank.exe -i --crlf",
      ["*"] = "/mnt/c/tools/win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "/mnt/c/tools/win32yank.exe -i --lf",
      ["*"] = "/mnt/c/tools/win32yank.exe -i --lf",
    },
    cache_enabled = 0,
  }
  vim.opt.clipboard = "unnamedplus"
end
