-- 
-- Set listchars
vim.o.listchars = 'nbsp:␣,eol:↲,tab:»\\ ,extends:›,precedes:‹,trail:•'

vim.opt.clipboard = 'unnamedplus'
-- Set showbreak
vim.o.showbreak = '↳ '

-- Disable number column in visual mode
vim.api.nvim_exec([[
  augroup my_visuallistchars
    autocmd!
    autocmd CursorMoved * if mode() =~# "[vV\<C-v>]" | set list | else | set nolist | endif
  augroup END
]], false)
