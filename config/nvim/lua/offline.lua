local M = {}

local data_dir = vim.fn.stdpath("data")
local bundle_bin_dir = data_dir .. "/airgap/bin"
local bundled_pack_dir = data_dir .. "/site/pack/airgap/start"

function M.is_enabled()
  if vim.env.NVIM_AIRGAP == "1" then
    return true
  end

  return vim.fn.isdirectory(bundle_bin_dir) == 1 or vim.fn.isdirectory(bundled_pack_dir) == 1
end

function M.prepend_bin_dir()
  if vim.fn.isdirectory(bundle_bin_dir) ~= 1 then
    return
  end

  local path = vim.env.PATH or ""
  if not vim.startswith(path, bundle_bin_dir .. ":") and path ~= bundle_bin_dir then
    vim.env.PATH = bundle_bin_dir .. ":" .. path
  end
end

vim.g.airgap_mode = M.is_enabled()
M.prepend_bin_dir()

return M
