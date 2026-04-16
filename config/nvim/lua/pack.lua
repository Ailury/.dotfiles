local offline = require("offline")

--  External plugins to install
-- =========================================================

if not offline.is_enabled() then
  vim.pack.add({
    "https://github.com/alexghergh/nvim-tmux-navigation",
    "https://github.com/mfussenegger/nvim-lint",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/nvim-mini/mini.diff",
    "https://github.com/nvim-mini/mini.files",
    "https://github.com/nvim-mini/mini.icons",
    "https://github.com/nvim-mini/mini.indentscope",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/y3owk1n/base16-pro-max.nvim",
  })
end

-- =========================================================
--  Builtin plugins to enable
-- =========================================================

vim.cmd.packadd("cfilter")
vim.cmd.packadd("nvim.undotree")
