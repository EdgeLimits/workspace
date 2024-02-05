return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      -- PATH = "prepend", -- "skip" seems to cause the spawning error
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "lua_ls",
        "pyright",
      },
      -- automatic_installation = true,
    })
    --
    -- mason_tool_installer.setup({
    --   ensure_installed = {
    --     "prettier", -- prettier formatter
    --     "stylua", -- lua formatter
    --     "isort", -- python formatter
    --     -- "black", -- python formatter
    --     "pylint", -- python linter
    --     "eslint_d", -- js linter
    --   },
    -- })
  end,
}
