-- make it easier to type
local map = vim.keymap.set

-- disable sinful arrow keys
for _, mode in ipairs({ "n", "i", "v" }) do
  for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
    map(mode, key, "<nop>", { noremap = true, silent = true })
  end
end

-- telescope keymaps
map(
  "n",
  "<leader>tf",
  "<CMD>Telescope find_files hidden=true<CR>",
  { noremap = true, desc = "Find files", silent = true }
)

map("n", "<leader>tb", "<CMD>Telescope buffers<CR>", { silent = true, noremap = true, desc = "Telescope buffers" })

map("n", "<leader>tc", "<CMD>Telescope colorscheme<CR>", { silent = true, noremap = true, desc = "Colourschemes" })

map("n", "<leader>tg", "<CMD>Telescope live_grep hidden=true", { silent = true, noremap = true, desc = "Live Grep" })

map(
  "n",
  "<leader>tC",
  "<CMD>Telescope find_files cwd=~/.config/nvim-from-scratch/<CR>",
  { silent = true, noremap = true, desc = "Find Config Files" }
)

map(
  "n",
  "<leader>tr",
  "<CMD>Telescope oldfiles<CR>",
  { noremap = true, silent = true, desc = "Telescope recent files" }
)

-- Lazy.nvim keymaps
map("n", "<leader>ll", "<CMD>Lazy<CR>", { silent = true, noremap = true, desc = "Lazy" })

map("n", "<leader>lu", "<CMD>Lazy update<CR>", { silent = true, noremap = true, desc = "Update plugins" })

map("n", "<leader>ls", "<CMD>Lazy sync", { silent = true, noremap = true, desc = "Lazy Sync" })

map({ "n", "v" }, ";", ":", { noremap = true })

map("n", "<leader>si", function()
  require("snacks").picker.icons()
end, { noremap = true, desc = "Snacks icon picker" })

map("n", "<leader>bd", "<CMD>bd<CR>", { noremap = true, desc = "Delete buffer", silent = true })

map("n", "<leader>bn", "<CMD>bnext<CR>", { noremap = true, desc = "Next buffer", silent = true })

map("n", "<leader>bp", "<CMD>bprevious<CR>", { noremap = true, desc = "Previous buffer", silent = true })

map("n", "<S-l>", "<CMD>bnext<CR>", { noremap = true, desc = "Next buffer", silent = true })

map("n", "<S-h>", "<CMD>bprevious<CR>", { noremap = true, desc = "Previous buffer", silent = true })

map("n", "<leader><leader>", "<C-^>", { silent = true, desc = "Switch to previous buffer", noremap = true })

map("i", "jj", "<Esc>", { silent = true, desc = "Exit insert mode" })

-- centre after scrolling with ctrl + d, u, f, b
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })
map("n", "<C-f>", "<C-f>zz", { silent = true })
map("n", "<C-b>", "<C-b>zz", { silent = true })

map("n", "G", "Gzz", { silent = true })
map("n", "gg", "ggzz", { silent = true })

map("n", "<leader>M", "<CMD>Mason<CR>", { silent = true, desc = "Open Mason", noremap = true })

map("n", "<Esc>", "<CMD>nohl<CR>", { silent = true })
map("n", "<leader>T", "<CMD>terminal<CR>", { silent = true, desc = "Open Terminal", noremap = true })

map({ "n", "v" }, "j", "gj", { silent = true })
map({ "n", "v" }, "k", "gk", { silent = true })
