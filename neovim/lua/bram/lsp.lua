

require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "gopls", "pyright" }
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

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
  float = {
    source = "always",
    border = "rounded",
  },
})
