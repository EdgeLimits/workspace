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

-- INFO: Enable an experimental fast module loader. See the PR for more information:
vim.loader.enable()

local config = {
    { import = "plugins" },
}

local opts = {
    install = {
      theme = "dracula",
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
  "keymaps",
  "options",
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
vim.cmd.colorscheme "dracula"



