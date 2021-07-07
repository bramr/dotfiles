DATA_PATH = vim.fn.stdpath('data')


-- Rust LSP
require'lspconfig'.rust_analyzer.setup{
  cmd = {DATA_PATH .. "/lspinstall/rust/rust-analyzer"},
  on_attach=require'completion'.on_attach
}


-- Use completion-nvim in every buffer
vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")
