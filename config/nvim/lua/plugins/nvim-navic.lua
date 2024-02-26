return {
  "SmiteshP/nvim-navic",
  requires = { "neovim/nvim-lspconfig", module = "lspconfig" },
  config = function()

    -- local lspconfig = require("lspconf:ig")

    local navic = require("nvim-navic")
    navic.setup({

    })
  end,
  module = "nvim-navic",
}
