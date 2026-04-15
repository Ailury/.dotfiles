-- =========================================================
--  Just overrides
-- =========================================================

vim.lsp.config("just", {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
})

-- =========================================================
--  Lua overrides (so that vim don't shout at me)
-- =========================================================

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      completion = { enable = true },
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
      workspace = {
        library = { vim.env.VIMRUNTIME },
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- =========================================================
--  Enable LSPs
-- =========================================================

vim.lsp.enable({
  "bashls",
  "biome",
  "clangd",
  "docker_language_server",
  "docker_compose_language_service",
  "gopls",
  "jsonls",
  "just",
  "lua_ls",
  "marksman",
  "ruff",
  --  "nixd",
  --  "rust_analyzer",
  "yamlls",
})
