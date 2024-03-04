-- Map the <Leader> key to <Space>.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Disable some in-built features which are unnecessary (and probably affects performance?)
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0


local config = {
    { import = "plugins" },
    { import = "plugins.lsp" },
}

local opts = {
    install = {
        colorsheme = { "dracula" },
    },
    checker = {
        enable = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    }
}

local modules = {
    "options",
    "keymaps",
    "autocmds",
}

local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)

require("lazy").setup(config, opts)

-- Safely load the necessary user-defined Lua modules meant to customise Neovim.
for _, module in ipairs(modules) do
  local ok, error = pcall(require, module)
  if not ok then
    print("Error loading module: " .. error)
  end
end

vim.o.termguicolors = true
vim.cmd.colorscheme("dracula")

-- INFO: Enable an experimental fast module loader. See the PR for more information:
vim.loader.enable()

-- vim.api.nvim_set_hl(0, 'NextFloatBorder', {bg='#3B4252', fg='#5E81AC'})
vim.api.nvim_set_hl(0, 'NormalFloat', {bg='#323543'})
-- vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='#3B4252'})
-- vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='#3B4252'})

