-- Register linters and formatters per language
local prettier = require('efmls-configs.formatters.prettier')
local stylua = require('efmls-configs.formatters.stylua')
local google_java_format = require('efmls-configs.formatters.google_java_format')
local dotnet_format = require('efmls-configs.formatters.dotnet_format')
local languages = {
  charp = { dotnet_format },
  css = { prettier },
  html = { prettier },
  java = { google_java_format },
  json = { prettier },
  typescript = { prettier },
  lua = { stylua },
}

local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

vim.lsp.config('efm', vim.tbl_extend('force', efmls_config, {
  cmd = { 'efm-langserver' },

  -- Pass your custom lsp config below like on_attach and capabilities
  --
  -- on_attach = on_attach,
  -- capabilities = capabilities,
}))
