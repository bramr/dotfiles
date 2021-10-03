DATA_PATH = vim.fn.stdpath('data')


-- LspInstall
require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
local lspconfig = require'lspconfig'
for _, server in pairs(servers) do
    lspconfig[server].setup{}
end

-- Rust LSP
require'lspconfig'.rust_analyzer.setup {cmd = {DATA_PATH .. "/lspinstall/rust/rust-analyzer"}, on_attach = require'completion'.attach}

-- PHP LSP
require'lspconfig'.intelephense.setup {
  cmd = {vim.fn.stdpath('data') .. "/lspinstall/php/node_modules/.bin/intelephense", "--stdio"},
  on_attach = require'completion'.common_on_attach
}

-- Bash
require'lspconfig'.bashls.setup {
  cmd = {DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
  on_attach = require'completion'.common_on_attach,
  filetypes = {"sh", "zsh"}
}

-- Lua
local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

lspconfig.lua.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- require'lspconfig'.sumneko_lua.setup {
--   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
--   on_attach = require'completion'.common_on_attach,
--   settings = {
--     lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = vim.split(package.path, ';')
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'}
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
--         maxPreload = 10000
--       }
--     }
--   }
-- }

require'lspconfig'.jsonls.setup {
  cmd = {"node", DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js", "--stdio"},
  on_attach = require'completion'.common_on_attach,

  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
      end
    }
  }
}

-- Use completion-nvim in every buffer
vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")
