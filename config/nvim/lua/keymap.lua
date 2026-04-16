-- =========================================================
--  Toggles
-- =========================================================

vim.keymap.set("n", "<leader>u", vim.cmd.Undotree, { desc = "Toggle Undotree" })

vim.keymap.set("n", "<leader>td", function()
  local enabled = vim.diagnostic.is_enabled({ bufnr = 0 })
  vim.diagnostic.enable(not enabled, { bufnr = 0 })
end, { desc = "Toggle diagnostics" })

local MiniIndentscope = require("mini.indentscope")

vim.keymap.set("n", "<leader>ti", function()
  vim.b.miniindentscope_disable = not vim.b.miniindentscope_disable

  if vim.b.miniindentscope_disable then
    MiniIndentscope.undraw()
  else
    MiniIndentscope.draw()
  end
end, { desc = "Toggle indent scope" })

local function indent_pattern(bufnr)
  local sw = vim.bo[bufnr].shiftwidth
  if sw == 0 then
    sw = vim.bo[bufnr].tabstop
  end
  return "│" .. string.rep(" ", math.max(sw - 1, 0))
end

vim.keymap.set("n", "<leader>tw", function()
  vim.wo.list = not vim.wo.list

  if vim.wo.list then
    local lcs = vim.opt_local.listchars:get()
    local pat = indent_pattern(0)
    lcs.leadmultispace = pat
    lcs.multispace = pat
    lcs.trail = "·"
    lcs.nbsp = "␣"
    vim.opt_local.listchars = lcs
  end
end, { desc = "Toggle whitespace guides" })

-- =========================================================
--  Movement enhancements
-- =========================================================

vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Move down" })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Center after moving" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Center after moving" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Center after moving" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Center after moving" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center after moving" })
vim.keymap.set("n", "=ap", "ma=ap'a", { desc = "Center after moving" })

-- =========================================================
--  Clipboard enhancements
-- =========================================================
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set("i", "<C-c>", "<Esc>")

-- =========================================================
--  Update vim.pack
-- =========================================================

vim.keymap.set("n", "<leader>pu", function()
  vim.pack.update()
end, { desc = "Pack update" })

-- =========================================================
--  Arglist (harpoon like but not persistent)
-- =========================================================

vim.keymap.set("n", "<leader>ha", function()
  vim.cmd("$argadd %")
  vim.cmd("argdedup")
end, { desc = "Arglist add current file" })

vim.keymap.set("n", "<leader>he", function()
  local args = vim.fn.argv()
  local items = {}

  for _, file in ipairs(args) do
    table.insert(items, {
      filename = file,
      lnum = 1,
      text = file,
    })
  end

  vim.fn.setqflist({}, " ", {
    title = "Arglist",
    items = items,
  })

  vim.cmd("copen")
end, { desc = "Arglist explore" })

-- Arglist jump
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. tostring(i), function()
    vim.cmd("silent! " .. tostring(i) .. "argument")
  end, { desc = "Arglist jump to " .. tostring(i) })
end

-- =========================================================
--  Visual indent
-- =========================================================

vim.keymap.set("v", "<", "<gv", { desc = "Visual indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Visual indent right" })

-- =========================================================
--  Splits
-- =========================================================

vim.keymap.set("n", "-", "<C-W>s", { remap = true, desc = "Horizontal split" })
vim.keymap.set("n", "\\", "<C-W>v", { remap = true, desc = "Vertical split" })

-- =========================================================
--  QOL improvements
-- =========================================================

vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Move cursor to most left" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "Move cursor to most right" })

vim.keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select the whole buffer content" })
vim.keymap.set("n", "x", '"_x', { desc = "Delete the character under the cursor without putting it in the register" })

vim.keymap.set("v", "J", ":m '>+1<cr> | :normal gv=gv<cr>", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<cr> | :normal gv=gv<cr>", { desc = "Move line up" })

-- =========================================================
--  Disable some default mappings
-- =========================================================

vim.keymap.set({ "n", "x" }, "Q", "<nop>")
