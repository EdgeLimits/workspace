-- LSP Config takes care of Mason installed LSP packages
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
-- https://www.youtube.com/watch?v=4BnVeOUeZxc&t=370s
return {
  "neovim/nvim-lspconfig",
  -- event = { "BufReadPre", "BufNewFile" },
  module = "lspconfig",
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('workspace-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-T>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace
          --  Similar to document symbols, except searches over your whole project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end

          -- LSP servers and clients are able to communicate to each other what features they support.
          --  By default, Neovim doesn't support everything that is in the LSP Specification.
          --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
          --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

          -- Enable the following language servers
          --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
          --
          --  Add any additional override configuration in the following tables. Available keys are:
          --  - cmd (table): Override the default command used to start the server
          --  - filetypes (table): Override the default list of associated filetypes for the server
          --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
          --  - settings (table): Override the default settings passed when initializing the server.
          --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
          local servers = {
            -- clangd = {},
            -- gopls = {},
            -- pyright = {},
            -- rust_analyzer = {},
            -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
            --
            -- Some languages (like typescript) have entire language plugins that can be useful:
            --    https://github.com/pmizio/typescript-tools.nvim
            --
            -- But for many setups, the LSP (`tsserver`) will work just fine
            -- tsserver = {},
            --

            lua_ls = {
              -- cmd = {...},
              -- filetypes { ...},
              -- capabilities = {},
              settings = {
                Lua = {
                  runtime = { version = 'LuaJIT' },
                  workspace = {
                    checkThirdParty = false,
                    -- Tells lua_ls where to find all the Lua files that you have loaded
                    -- for your neovim configuration.
                    library = {
                      '${3rd}/luv/library',
                      unpack(vim.api.nvim_get_runtime_file('', true)),
                    },
                    -- If lua_ls is really slow on your computer, you can try this instead:
                    -- library = { vim.env.VIMRUNTIME },
                  },
                  -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                  -- diagnostics = { disable = { 'missing-fields' } },
                },
              },
            },
          pyright = {
            filetypes = {"python"},
          },            
          tsserver = {},
        }
        end,
    })
  end
}
    -- local lspconfig = require("lspconfig")
    --
    -- -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
    -- -- local capabilities = cmp_nvim_lsp.default_capabilities()
    --
    -- local opts = { noremap = true, silent = true }
    -- local on_attach = function(client, bufnr)
    --   opts.buffer = bufnr
    --
    --   vim.keymap.set("n", "<leader>gl", "<cmd>Telescope lsp_references<cr>", { desc = "List LSP preferences" .. opts })
    --   vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "List LSP preferences" })
    --   vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "List LSP definitions" })
    --   vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
    -- end
    --
    --
    -- -- configure lua server (with special settings)
    -- lspconfig["lua_ls"].setup({
    --   -- capabilities = capabilities,
    --   on_attach = on_attach,
    --   settings = {
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
  --
  --   -- configure python server
  --   lspconfig["pyright"].setup({
  --     capabilities = capabilities,
  --     on_attach = on_attach,
  --     filetypes = {"python"},
  --   })
  --
  --   -- configure typescript server with plugin
  --   lspconfig["tsserver"].setup({
  --     capabilities = capabilities,
  --     on_attach = on_attach,
  --   })
  --
  --   local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
  --   for type, icon in pairs(signs) do
  --     local hl = "DiagnosticSign" .. type
  --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  --   end
  -- end,
-- }
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
