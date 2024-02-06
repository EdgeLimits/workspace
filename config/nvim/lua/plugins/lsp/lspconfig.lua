-- LSP Config takes care of Mason installed LSP packages
-- https://www.youtube.com/watch?v=4BnVeOUeZxc&t=370s
-- https://github.com/josean-dev/dev-environment-files/blob/e2ccfd444918260e39927a48ca9edb02939bf433/.config/nvim/lua/josean/plugins/lsp/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  module = "lspconfig",
  dependencies = {
    -- TODO: understand why do I need theese
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      vim.keymap.set("n", "<leader>gl", "<cmd>Telescope lsp_references<cr>", { desc = "List LSP preferences" .. opts })
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "List LSP preferences" })
      vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "List LSP definitions" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
    end


    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    -- configure python server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {"python"},
    })

    -- configure typescript server with plugin
    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end,
}
    --
    -- -- import cmp-nvim-lsp plugin
    -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
    --
    -- local keymap = vim.keymap -- for conciseness
    --
    -- local opts = { noremap = true, silent = true }
    -- local on_attach = function(client, bufnr)
    --   opts.buffer = bufnr
    --
    --   -- set keybinds
    --   opts.desc = "Show LSP references"
    --   keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
    --
    --   opts.desc = "Go to declaration"
    --   keymap.se"n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
    --
    --   opts.desc = "Smart rename"
    --   keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
    --
    --   opts.desc = "Show buffer diagnostics"
    --   keymap.sets"n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
    --
    --   opts.desc = "Show line diagnostics"
    --   keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
    --
    --   opts.desc = "Go to previous diagnostic"
    --   keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
    --
    --   opts.desc = "Go to next diagnostic"
    --   keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
    --
    --   opts.desc = "Show documentation for what is under cursor"
    --   keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
    --
    --   opts.desc = "Restart LSP"
    --   keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    -- end
    --
    -- -- used to enable autocompletion (assign to every lsp server config)
    -- local capabilities = cmp_nvim_lsp.default_capabilities()
    --
    -- -- Change the Diagnostic symbols in the sign column (gutter)
    -- -- (not in youtube nvim video)
    -- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    -- for type, icon in pairs(signs) do
    --   local hl = "DiagnosticSign" .. type
    --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    -- end
    --
    -- -- configure html server
    -- lspconfig["html"].setup({
    --   capabilities = capabi
    --   on_attach = on_attach,
    -- })
    --
    -- -- configure typescript server with plugin
    -- lspconfig["tsserver"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })
    --
    -- -- configure emmet language server
    -- lspconfig["emmet_ls"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    -- })
    --
    -- -- configure python server
    -- lspconfig["pyright"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })
    --
    -- -- configure lua server (with special settings)
    -- lspconfig["lua_ls"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   settings = { -- custom settings for lua
    --     Lua = {
    --       -- make the language server recognize "vim" global
    --       diagnostics = {
    --         globals = { "vim" },
    --       },
    --       workspace = {
    --         -- make language server aware of runtime files
    --         library = {
    --           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
    --           [vim.fn.stdpath("config") .. "/lua"] = true,
    --         },
    --       },
    --     },
    --   },
    -- })
