if vim.loader then
  vim.loader.enable(true)
end
require("config.lazy")
require("config.keymaps")
require("config.lsp")
require("config.options")
require("config.autocmds")
