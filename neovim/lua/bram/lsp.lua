

require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "gopls" }
}


-- Make usable for neovim config
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})
