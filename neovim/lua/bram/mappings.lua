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

-- map('n', '<C-u>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], nrs)
-- map('n', '<C-i>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], nrs)

-- Completion
map('i', '<Tab>',  'pumvisible() ? "\\<C-n>" : "\\<Tab>"', nrx)
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', nrx)

-- Spelling
map('n', 'z-', '1z=', nr);


vim.api.nvim_create_autocmd('LspAttach', {
  desc = ' Coding',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<leader>rf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- WhichKey mappings
local wk = require("which-key")

wk.add({
  { '<leader>o', '<cmd>Oil<cr>', desc= '󰏇 Oil'},
  { '<leader>v', '<cmd>vsplit<cr>', desc=' Split vertical'},
  { '<leader><space>', '<cmd>Telescope find_files<cr>', desc=' Find files'},
  { '<leader>b', '<cmd>Telescope buffers<cr>', desc='󰮗 Find buffer'},
  { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc='󰙅 Explorer'},
  { '<leader>p', '<cmd>lua vim.diagnostic.setqflist()<cr>', desc=' Show problems'},
  { '<leader>t', '<cmd>ToggleTerm size=24 direction=horizontal<cr>', desc=' Terminal'},

  { '<leader>s', desc='󰓆 Spelling'},
  { '<leader>se', '<cmd>setlocal spell spelllang=en_us<cr>', desc='󰓆 English (US)'},
  { '<leader>sn', '<cmd>setlocal spell spelllang=nl<cr>', desc='󰓆 Nederlands'},
  { '<leader>sd', '<cmd>setlocal spell spelllang=<cr>', desc='󰓆 Disable'},

  { '<leader>f', desc=' Find'},
  { '<leader>ff', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=.> <cr>', desc=' Files (including hidden)'},
  { '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], desc=' Grep'},
  { '<leader>fp', [[<cmd>lua require('telescope.builtin').diagnostics()<cr>]], desc=' Find problems'},
  { '<leader>fc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], desc=' Git commits'},
  { '<leader>fg', [[<cmd>lua require('telescope.builtin').git_files()<cr>]], desc=' Git files'},
  { '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], desc=' Help tags'},

  { '<leader>z', desc=' Misc'},
  { '<leader>ze', '<cmd>view ~/dotfiles/misc/emoji.txt<cr>', desc=' Emoji cheat sheet'},
  { '<leader>zg', '<cmd>lua _LAZYGIT_TOGGLE()<cr>', desc=' Lazygit'},
  { '<leader>zh', '<cmd>lua _HTOP_TOGGLE()<cr>', desc=' Htop'},
  { '<leader>zm', '<cmd>view ~/dotfiles/misc/markdown.md<cr>', desc=' Markdown cheat sheet'},
  { '<leader>zs', '<cmd>w !sudo tee %<cr>', desc='󰯙 sudo write'},
  { '<leader>zt', '<cmd>ToggleTerm direction=float<cr>', desc=' Terminal'},

  { '<leader>d', desc=' Debug'},
  { '<leader>db', [[<cmd>DapToggleBreakpoint<cr>]], desc='Toggle breakpoint'},
  { '<leader>dc', [[<cmd>DapContinue<cr>]], desc='Continue'},
  { '<leader>di', [[<cmd>DapStepInto<cr>]], desc='Step into'},
  { '<leader>do', [[<cmd>DapStepOver<cr>]], desc='Step over'},
  { '<leader>dt', [[<cmd>DapStepOut<cr>]], desc='Step out'},
  { '<leader>dw', [[<cmd>DapTerminate<cr>]], desc='Terminate'},
  { '<leader>dx', [[<cmd>DapToggleRepl<cr>]], desc='Toggle repl'},
  { '<leader>dy', [[<cmd>lua require("dapui").toggle()<cr>]], desc='Toggle UI'},

  { '<leader>g', desc=' Golang'},
  { '<leader>gb', [[<cmd>GoBreakToggle<cr>]], desc='Toggle breakpoint'},
  { '<leader>gd', [[<cmd>GoDebug<cr>]], desc='Debug'},
  { '<leader>gf', [[<cmd>GoFmt<cr>]], desc='Format'},
  { '<leader>gi', [[<cmd>GoImport<cr>]], desc='Import'},
  { '<leader>gl', [[<cmd>GoLint<cr>]], desc='Lint'},
  { '<leader>gr', [[<cmd>GoRun<cr>]], desc='Run'},
  { '<leader>gt', desc=' Test'},
  { '<leader>gta', [[<cmd>GoAddTest<cr>]], desc='Add test'},
  { '<leader>gtf', [[<cmd>GoTestFile<cr>]], desc='Test file'},
  { '<leader>gtr', [[<cmd>GoTest<cr>]], desc='Run test'},
  { '<leader>gx', [[<cmd>GoDbgStop<cr>]], desc='Stop debug'},
})

