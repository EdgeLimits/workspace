local opt = vim.opt
opt.signcolumn = "yes" -- Allow the sign column to show else it'll keep shifting later on
opt.iskeyword:append("-") -- Make Neovim recognise dash-seperated words as a single word (JSX, Markdown, etc)
opt.scrolloff = 6 -- Maintain a buffer of rows between the current row & the either ends of the window
opt.signcolumn = "yes" -- Allow the sign column to show else it'll keep shifting later on

-- opt.cursorline = true -- Configure Neovim to highlight the current location of the cursor
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.opt.clipboard = 'unnamedplus'
--
-- -- Enable break indent
-- vim.opt.breakindent = true
--
-- -- Save undo history
-- vim.opt.undofile = true
--
-- -- Case-insensitive searching UNLESS \C or capital in search
-- vim.opt.ignorecase = true
-- vim.opt.smartcase = true
--
-- -- Keep signcolumn on by default
-- vim.opt.signcolumn = 'yes'
--
-- -- Decrease update time
-- vim.opt.updatetime = 250
-- vim.opt.timeoutlen = 300
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
--
-- -- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'split'
--
-- -- Show which line your cursor is on
-- vim.opt.cursorline = true
--
-- -- Minimal number of screen lines to keep above and below the cursor.
-- vim.opt.scrolloff = 10



-- opt.hlsearch = false -- Set highlight on search
-- opt.laststatus = 3 -- Enable the global status line
-- opt.completeopt = "menu,menuone,noselect" -- Make the autocompletion window more accessible
-- opt.conceallevel = 3 -- Hide the * markups for bold & italics
-- opt.expandtab = true -- Use spaces instead of tabs
-- opt.autoindent = true -- Automatically indent new lines
--
-- opt.ignorecase = true -- Ignore casing when searching for a word
-- opt.inccommand = "nosplit" -- Preview incremental substitute
-- opt.list = true -- Show invisible whitespace characters
-- -- opt.shiftround = true -- Roundup indentations
-- -- TODO: Figure a way out to configure these options specific to the filetype instead
-- opt.shiftwidth = 2 -- The default size of an indentation (this will be configure per filetype later on)
-- opt.tabstop = 2 -- Number of Spaces, a single tab counts for
-- opt.smartcase = true -- Don't ignore casing with capitals
-- opt.spelllang = { "en" } -- The language to use when spelling checking
-- opt.splitbelow = true -- Put new windows below current
-- opt.splitright = true -- Put new windows right of the current
-- opt.timeoutlen = 300 -- ??
-- opt.undofile = true -- ??
-- opt.undolevels = 10000 -- ??
-- opt.updatetime = 200 -- Save swap file & trigger CursorHold
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
-- opt.winminwidth = 5 -- Maximum window width
-- opt.swapfile = false --Disable swapfile creation since it gets annoying after a while
--
-- -- INFO: Apply some aesthetic improvements to the UI/UX
-- opt.cursorline = true -- Configure Neovim to highlight the current location of the cursor
-- opt.termguicolors = true -- True color support for various plugins
-- opt.pumblend = 10 -- Make the completion popup window a bit transparent
-- opt.pumheight = 10 -- Display only 10 rows for the completion menu
-- opt.mouse = "a" -- Enable mouse support
-- opt.background = "dark" -- Tell Neovim that the background color is dark
--
-- -- The following options are enabled for performance improvement reasons
-- -- INFO: Found these settings in the documentations (scroll down a bit in the ":h wrap-off" section)
-- opt.showmode = false -- Disable showing the current mode since its already visible on the statusline
-- opt.showcmd = false -- Disable prompting the invoked command back to the user
-- opt.ruler = false -- Disable showing the current location of the cursor since the Lualine plugin takes care of it
--
-- -- INFO: These are some QoL improvements to make writing code so much easier!
-- opt.wrap = false -- Configure Neovim to not wrap the contents of the buffer
-- opt.autowrite = true -- Save the contents of the buffer after exiting Insert mode
-- opt.confirm = true -- Prompt to save the contents of the buffer before exiting
-- opt.showbreak = "...." -- Add a slight padding to wrapped lines to distinguish them from the rest of the lines
-- opt.sidescroll = 8 -- Enable horinzontal scrolling when word wrap is disabled
-- opt.breakindent = true -- Enable break indent
--
-- opt.signcolumn = "yes" -- Allow the sign column to show else it'll keep shifting later on
-- opt.iskeyword:append("-") -- Make Neovim recognise dash-seperated words as a single word (JSX, Markdown, etc)
-- opt.scrolloff = 6 -- Maintain a buffer of rows between the current row & the either ends of the window
-- opt.number = true -- Enable the current line number to be shown
-- opt.relativenumber = true -- Display the row number relative to the up/down rows
-- opt.signcolumn = "yes" -- Allow the sign column to show else it'll keep shifting later on
-- opt.shell = "zsh" -- Explicitly tell Neovim to use ZSH for terminal commands instead of relying on $SHELL
-- opt.backspace = "indent,eol,start" -- Allow backspacing over autoindent, line breaks & the start of insert
