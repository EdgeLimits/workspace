-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Relative line numbers &  make line numbers default
vim.o.relativenumber = true
vim.o.number = true
vim.wo.number = true

-- cursor line
vim.o.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'
  
-- Tabs & indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true

-- Line wrapping
vim.o.wrap = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- backspace
vim.o.backspace = "indent,eol,start"

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- appearance
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.signcolumn = "yes"

-- split windows
vim.o.splitright = true 
vim.o.splitbelow = true

vim.opt.iskeyword:append("-")

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


-- -- Enable break indent
-- vim.o.breakindent = true

-- -- Save undo history
-- vim.o.undofile = true


