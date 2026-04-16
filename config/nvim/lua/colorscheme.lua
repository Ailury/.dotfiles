require("base16-pro-max").setup({
  colors = require("base16-pro-max.parser").get_base16_colors("~/.config/nvim/colorscheme/base16.yml"),
  styles = {
    italic = true,
    bold = true,
  },
  plugins = {
    enable_all = false,
    nvim_mini_mini_diff = true,
    nvim_mini_mini_icons = true,
    nvim_mini_mini_files = true,
  },
  highlight_groups = {
    QuickFixLine = { fg = "red" },
  },
})

vim.cmd.colorscheme("base16-pro-max")
