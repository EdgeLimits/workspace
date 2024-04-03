return {
  "SmiteshP/nvim-navic",
  module = "nvim-navic",
  requires = { "neovim/nvim-lspconfig", module = "lspconfig" },
  config = function()
    local navic = require("nvim-navic")
    navic.setup({})
    -- require("lspconfig").clangd.setup {
    --   on_attach = function(client, bufnr)
    --     navic.attach(client, bufnr)
    --   end
    -- }
  end,
}
