local map = vim.api.nvim_set_keymap

nr = { noremap = true }
nrs = { noremap = true, silent = true }
nrx = { noremap = true, expr = true }


-- Map leader to space
vim.g.mapleader = ' '
map('n', '<Space>', '', nr)


-- General
map('n', '<c-o>', '<cmd>set invhlsearch<CR>', nr)

-- Tabs
map('n', '<Tab>', ':tabnext<CR>', nr)
map('n', '<S-Tab>', ':tabprevious<CR>', nr)
map('n', '<Leader>tn', ':tabnew<CR>', nr)
map('n', '<Leader>tc', ':tabclose<CR>', nr)
map('n', '<Leader>tt', '<cmd>lua require("FTerm").toggle()<CR>', nrs)
map('n', '<c-t>', '<cmd>lua require("FTerm").toggle()<CR>', nrs)
map('t', '<c-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', nrs)

-- Telescope
map('n', '<c-f>', ':Telescope find_files<CR>', nrs)
map('n', '<Leader><Space>', ':Telescope find_files<CR>', nr)
map('n', '<Leader>ff', ':Telescope find_files<CR>', nr)
map('n', '<Leader>fb', ':Telescope buffers<CR>', nr)
map('n', '<Leader>fg', [[<Cmd>lua require('telescope.builtin').git_files()<CR>]], nrs)

-- Completion
map('i', '<Tab>',  'pumvisible() ? "\\<C-n>" : "\\<Tab>"', nrx)
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', nrx)

