local map = vim.api.nvim_set_keymap

local nr = { noremap = true }
local nrs = { noremap = true, silent = true }
local nrx = { noremap = true, expr = true }


-- Map leader to space
vim.g.mapleader = ' '
map('n', 'J', '10j', nr)
map('n', 'K', '10k', nr)
map('n', '<Space>', '', nrs)

-- General
map('n', '<c-o>', '<cmd>set invhlsearch<CR>', nr)

-- Tabs
map('n', '<Tab>', ':tabnext<CR>', nr)
map('n', '<S-Tab>', ':tabprevious<CR>', nr)

map('n', '<c-t>', '<cmd>lua require("FTerm").toggle()<CR>', nrs)
map('t', '<c-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', nrs)

local wk = require("which-key")

wk.register({
  ['<space>'] = {'<cmd>Telescope find_files<CR>', ' Find files'},
  t = {'<cmd>lua require("FTerm").toggle()<CR>', ' Toggle Terminal'},
  w = {'<cmd>tabnew<CR>', ' Tab create'},
  q = {'<cmd>tabclose<CR>', ' Tab close'},
  f = {
    name = '  Find Stuff',
    f = { '<cmd>Telescope find_files<CR>', 'Find files'},
    b = { '<cmd>Telescope buffers<CR>', 'Find buffer'},
    r = { [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], 'Ripgrep'},
    h = { [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], 'Help tags'},
    c = { [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], 'Git commits'},
    g = { [[<cmd>lua require('telescope.builtin').git_files()<CR>]], 'Git files'},
    l = { [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>]], 'Workspace diagnostics'}
  },
  l = {
    name = '  Coding',
    h = {[[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]],"Hover doc"},
    s = {[[<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]],"Show signature"},
    r = {[[<cmd>lua require('lspsaga.rename').rename()<CR>]],"Rename"},
    p = {[[<cmd>lua require('lspsaga.provider').preview_definition()<CR>]],"Previous definition"},
    c = {[[<cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>]],"Cursor diagnostics"},
    d = {[[<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>]],"Line disagnostics"},
    f = {[[<cmd>lua vim.lsp.buf.formatting()<CR>]],"Formatting (LSP)"},
    w = {[[<cmd>lua vim.lsp.buf.formatting()<CR>]],"Fix trailing whitespace"},
  },
  g = {
    name = '  Goto',
    d = {'<cmd>lua vim.lsp.buf.declaration()<CR>',"Goto declaration"},
    D = {'<cmd>lua vim.lsp.buf.definition()<CR>',"Goto definition"},
  },
  s = {
    name = ' ﬜ Spelling',
    e = {'<cmd>setlocal spell spelllang=en_us<CR>', 'English (US)'},
    n = {'<cmd>setlocal spell spelllang=nl<CR>', 'Nederlands'},
    d = {'<cmd>setlocal spell spelllang=<CR>', 'Disable'},
  }
}, { prefix = '<Leader>' })

map('n', '+', 'gg=G<CR>gi', nrs) -- reformat buffer

map('n', '<C-j>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], nrs)
map('n', '<C-k>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], nrs)

-- Completion
map('i', '<Tab>',  'pumvisible() ? "\\<C-n>" : "\\<Tab>"', nrx)
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', nrx)

-- Spelling
map('n', 'z-', '1z=', nr);
