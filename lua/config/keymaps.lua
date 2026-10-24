-- make it easier to type
local map = vim.keymap.set

-- disable sinful arrow keys
for _, mode in ipairs({ "n", "i", "v" }) do
  for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
    map(mode, key, "<nop>", { noremap = true, silent = true })
  end
end

-- telescope keymaps
map("n", "<leader>tf", "<CMD>Telescope find_files hidden=true<CR>", { noremap = true, desc = "Find files", silent = true })

map("n", "<leader>tb", function()
  vim.cmd("Telescope buffers")
end, { noremap = true, desc = "Telescope buffers" })

map("n", "<leader>tc", function()
  vim.cmd("Telescope colorscheme")
end, { noremap = true, desc = "Colourschemes" })

map("n", "<leader>tg", function()
  vim.cmd("Telescope live_grep hidden=true")
end, { noremap = true, desc = "Live Grep" })

map("n", "<leader>tC", function()
  vim.cmd("Telescope find_files cwd=~/.config/nvim-from-scratch/")
end, { noremap = true, desc = "Find Config Files" })

map(
  "n",
  "<leader>tr",
  "<cmd>Telescope oldfiles<CR>",
  { noremap = true, silent = true, desc = "Telescope recent files" }
)

-- Lazy.nvim keymaps
map("n", "<leader>ll", function()
  vim.cmd("Lazy")
end, { noremap = true, desc = "Lazy" })

map("n", "<leader>lu", function()
  vim.cmd("Lazy update")
end, { noremap = true, desc = "Update plugins" })

map("n", "<leader>ls", function()
  vim.cmd("Lazy sync")
end, { noremap = true, desc = "Lazy Sync" })

map({ "n", "v" }, ";", ":", { noremap = true })

map("n", "<leader>si", function()
  Snacks.picker.icons()
end, { noremap = true, desc = "Snacks icon picker" })

map("n", "<leader>bd", function()
  vim.cmd("bd")
end, { noremap = true, desc = "Delete buffer", silent = true })

map("n", "<leader>bn", function()
  vim.cmd("bnext")
end, { noremap = true, desc = "Next buffer", silent = true })

map("n", "<leader>bp", function()
  vim.cmd("bprevious")
end, { noremap = true, desc = "Previous buffer", silent = true })

map("n", "<S-l>", function()
  vim.cmd("bnext")
end, { noremap = true, desc = "Next buffer", silent = true })

map("n", "<S-h>", function()
  vim.cmd("bprevious")
end, { noremap = true, desc = "Previous buffer", silent = true })

map("n", "<leader><leader>", "<C-^>", { silent = true, desc = "Switch to previous buffer", noremap = true })

map("i", "jj", "<Esc>", { silent = true, desc = "Exit insert mode" })

-- centre after scrolling with ctrl + d, u, f, b
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })
map("n", "<C-f>", "<C-f>zz", { silent = true })
map("n", "<C-b>", "<C-b>zz", { silent = true })

map("n", "G", "Gzz", { silent = true })
map("n", "gg", "ggzz", { silent = true })

map("n", "<leader>M", "<Cmd>Mason<CR>", { silent = true, desc = "Open Mason", noremap = true })

map("n", "<Esc>", "<Cmd>nohl<CR>", { silent = true })
map("n", "<leader>T", "<Cmd>terminal<CR>", { silent = true, desc = "Open Terminal", noremap = true })

map({ "n", "v" }, "j", "gj", { silent = true })
map({ "n", "v" }, "k", "gk", { silent = true })
