local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local config = {
  { import = "edgelimits.plugins" },
  { import = "edgelimits.plugins.lsp" },
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

require("lazy").setup(config, opts)
