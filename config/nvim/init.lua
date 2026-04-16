if vim.loader then
  vim.loader.enable()
end

require("offline")
require("pack")
require("colorscheme")
require("option")
require("plugin")
require("keymap")
require("autocmd")
require("diagnostic")
require("lsp")
