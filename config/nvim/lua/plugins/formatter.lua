return {
  'stevearc/conform.nvim',
  opts = {},
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        html = { "htmlbeautifier" },
        python = { "black" },
        css = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>l", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)"})

  end,
}
