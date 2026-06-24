

require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "gopls", "pyright", "jdtls" }
}


-- Make usable for neovim config
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      hint = {
        enable = true,
        arrayIndex = "Disable",
      },
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})
vim.lsp.enable("lua_ls")

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
  float = {
    source = "always",
    border = "rounded",
  },
})
