local cmd = vim.cmd

vim.g.tokyonight_style = 'night'
cmd('colorscheme tokyonight')

vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.wo.wrap = false -- Display long lines as just one line
cmd'set whichwrap+=<,>,[,],h,l' -- move to next line with theses keys
cmd'syntax on' -- syntax highlighting
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages
cmd('set colorcolumn=99999') -- fix indentline for now
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
-- vim.o.t_Co = "256" -- Support 256 colors
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
cmd('set ts=4') -- Insert 2 spaces for a tab
cmd('set sw=4') -- Change the number of space characters inserted for indentation
cmd('set expandtab') -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = true -- set numbered lines
vim.wo.relativenumber = true -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
-- vim.o.backup = false -- This is recommended by coc
-- vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 100 -- Faster completion
vim.o.timeoutlen = 500 -- By default timeoutlen is 1000 ms
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
-- vim.g.nvim_tree_disable_netrw = O.nvim_tree_disable_netrw -- enable netrw for remote gx gf support (must be set before plugin's packadd)
vim.g.loaded_netrwPlugin = 1 -- needed for netrw gx command to open remote links in browser
cmd('filetype plugin on') -- filetype detection


-- Completion options
vim.api.nvim_set_option('completeopt', 'menuone,noinsert,noselect')
cmd('set shortmess+=c')


-- Treesitter support
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "c", "cmake", "css", "dockerfile", "go", "gomod", "html", "java", "javascript",
    "json", "lua", "php", "python", "regex", "rust", "typescript", "vue", "yaml"
  },
  ignore_install = { },
  highlight = {
    enable = true,
    disable = { },
  },
}
