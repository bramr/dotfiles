vim.cmd [[
try
  let g:gh_color = "soft"
  let g:rehash256 = 1
  let g:tokyonight_style = "night"
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

