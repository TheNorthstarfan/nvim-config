-- make it easier to type
local map = vim.keymap.set

-- telescope keymaps
map("n", "<leader>tf", function()
  vim.cmd("Telescope find_files hidden=true")
end, { noremap = true, desc = "Find files" })

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
