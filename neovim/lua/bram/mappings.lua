local map = vim.api.nvim_set_keymap

local nr = { noremap = true }
local nrs = { noremap = true, silent = true }
local nrx = { noremap = true, expr = true }

--Remap space as leader key
map("", "<Space>", "<Nop>", nrs)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Faster scrolling
map('n', 'J', '10j', nr)
map('n', 'K', '10k', nr)

-- Tabs
map('n', '<Tab>', ':tabnext<CR>', nr)
map('n', '<S-Tab>', ':tabprevious<CR>', nr)

-- Better window navigation
map("n", "<C-h>", "<C-w>h", nr)
map("n", "<C-j>", "<C-w>j", nr)
map("n", "<C-k>", "<C-w>k", nr)
map("n", "<C-l>", "<C-w>l", nr)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", nrs)
map("n", "<S-h>", ":bprevious<CR>", nrs)

-- Stay in indent mode
map("v", "<", "<gv", nrs)
map("v", ">", ">gv", nrs)

map('n', '+', 'gg=G<CR>gi', nrs) -- reformat buffer

map('n', '<C-u>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], nrs)
map('n', '<C-i>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], nrs)

-- Completion
map('i', '<Tab>',  'pumvisible() ? "\\<C-n>" : "\\<Tab>"', nrx)
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', nrx)

-- Spelling
map('n', 'z-', '1z=', nr);

-- WhichKey mappings
local wk = require("which-key")
wk.register({
  ['<space>'] = {'<cmd>Telescope find_files<CR>', ' Find files'},
  b = { '<cmd>Telescope buffers<CR>', '󰮗 Find buffer'},
  t = { '<cmd>ToggleTerm size=24 direction=horizontal<cr>', ' Terminal' },
  p = { '<cmd>lua vim.diagnostic.setqflist()<CR>', ' Show problems'},
  e = { "<cmd>NvimTreeToggle<CR>", "󰙅 Explorer" },
  w = {'<cmd>tabnew<CR>', '󰎔 Tab create'},
  q = {'<cmd>tabclose<CR>', ' Tab close'},
  f = {
    name = ' Find Stuff',
    f = { '<cmd>Telescope find_files<CR>', 'Find files'},
    F = { '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=.> <CR>', 'Find files (hidden)'},
    b = { '<cmd>Telescope buffers<CR>', 'Find buffer'},
    p = { [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]], ' Find problems'},
    r = { [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], 'Ripgrep'},
    h = { [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], 'Help tags'},
    c = { [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], 'Git commits'},
    g = { [[<cmd>lua require('telescope.builtin').git_files()<CR>]], 'Git files'},
    l = { [[<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>]], 'Workspace diagnostics'},
    t = { '<cmd>NvimTreeToggle<CR>', 'Toggle filebrowser'},
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
    g = {'<cmd>lua vim.lsp.buf.declaration()<CR>',"Goto declaration"},
    G = {'<cmd>lua vim.lsp.buf.definition()<CR>',"Goto definition"},
  },
  d = {
    name = '  Debug',
    b = {[[<cmd>DapToggleBreakpoint<CR>]], "Toggle breakpoint"},
    c = {[[<cmd>DapContinue<CR>]], "Continue"},
    i = {[[<cmd>DapStepInto<CR>]], "Step into"},
    o = {[[<cmd>DapStepOver<CR>]], "Step over"},
    t = {[[<cmd>DapStepOut<CR>]], "Step out"},
    x = {[[<cmd>DapTerminate<CR>]], "Terminate"},
    y = {[[<cmd>DapToggleRepl<CR>]], "Toggle repl"},
    w = {[[<cmd>lua require("dapui").toggle()<CR>]], "Toggle UI"}
  },
  g = {
    name = '  Golang',
    b = {[[<cmd>GoBreakToggle<CR>]],"Toggle breakpoint"},
    d = {[[<cmd>GoDebug<CR>]],"Debug"},
    f = {[[<cmd>GoFmt<CR>]],"Format"},
    i = {[[<cmd>GoImport<CR>]],"Import"},
    l = {[[<cmd>GoLint<CR>]],"Lint"},
    r = {[[<cmd>GoRun<CR>]],"Run"},
    t = {
      name = '  Test',
      a = {[[<cmd>GoAddTest<CR>]], "Add"},
      r = {[[<cmd>GoTest<CR>]], "Run"},
      f = {[[<cmd>GoTestFile<CR>]], "Run file"},
      n = {[[<cmd>GoTestFile<CR>]], "Run function"},
    },
    x = {[[<cmd>GoDbgStop<CR>]],"Stop debug"},
  },
  n = {
    name = '  Neorg',
    i = {[[<cmd>Neorg index<CR>]], "Go to index"},
    j = {[[<cmd>Neorg journal<CR>]], "Journal"},
    p = {[[<cmd>Neorg workspace personal<CR>]], "Workspace: personal"},
    r = {[[<cmd>Neorg return<CR>]], "Return"},
    w = {[[<cmd>Neorg workspace work<CR>]], "Workspace: work"},
  },
  s = {
    name = ' 󰓆 Spelling',
    e = {'<cmd>setlocal spell spelllang=en_us<CR>', 'English (US)'},
    n = {'<cmd>setlocal spell spelllang=nl<CR>', 'Nederlands'},
    d = {'<cmd>setlocal spell spelllang=<CR>', 'Disable'},
  },
  o = {'<cmd>Oil<CR>', '󰏇 Oil'},
  v = {'<cmd>vsplit<CR>', '  Split vertical'},
  z = {
    name = '  Misc',
    e = { '<cmd>view ~/dotfiles/misc/emoji.txt<cr>', ' Emoji cheat sheet' },
    g = { '<cmd>lua _LAZYGIT_TOGGLE()<cr>', ' Lazygit' },
    h = { '<cmd>lua _HTOP_TOGGLE()<cr>', ' Htop' },
    m = { '<cmd>view ~/dotfiles/misc/markdown.md<cr>', ' Markdown cheat sheet' },
    s = { '<cmd>w !sudo tee %<cr>', '󰯙 sudo write' },
    t = { '<cmd>ToggleTerm direction=float<cr>', ' Terminal' }
  }

}, { prefix = '<Leader>' })

-- Leader shortcuts not in menu


