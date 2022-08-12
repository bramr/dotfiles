local cmd = vim.cmd
local o = vim.o
local wo = vim.wo

TERMINAL = vim.fn.expand('$TERMINAL')

o.title = true
o.titlestring="%<%F%=%l/%L - nvim"
o.pumheight = 10 -- Makes popup menu smaller
o.fileencoding = "utf-8" -- The encoding written to file
o.cmdheight = 2 -- More space for displaying messages
o.mouse = "a" -- Enable your mouse
o.termguicolors = true -- set term gui colors most terminals support this
o.splitbelow = true -- Horizontal splits will automatically be below
o.splitright = true -- Vertical splits will automatically be to the right
o.showtabline = 2 -- Always show tabs
o.showmode = false -- We don't need to see things like -- INSERT -- anymore
o.backup = false -- This is recommended by coc
o.writebackup = false -- This is recommended by coc
o.updatetime = 100 -- Faster completion
o.timeoutlen = 500 -- By default timeoutlen is 1000 ms
o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
o.conceallevel = 0 -- So that I can see `` in markdown files
o.scrolloff = 8
o.sidescrolloff = 8
o.tabstop = 2 -- Insert 2 spaces for a tab
o.shiftwidth = 2 -- Change the number of space characters inserted for indentation
o.expandtab = true -- Converts tabs to spaces
o.cmdheight = 2 -- more space to display messages

cmd('let &titleold="'..TERMINAL..'"')
cmd 'set whichwrap+=<,>,[,],h,l' -- move to next line with theses keys
cmd 'set guifont=Hack\\ Nerd\\ Font:h16' -- set font for neovide
cmd 'syntax on' -- syntax highlighting

wo.wrap = false -- Display long lines as just one line
wo.number = true -- set numbered lines
wo.relativenumber = true -- set relative number
wo.cursorline = true -- Enable highlighting of the current line
wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

vim.bo.smartindent = true -- Makes indenting smart
