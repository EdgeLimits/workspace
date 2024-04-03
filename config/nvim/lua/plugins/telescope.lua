-- Large JSON file solution: https://github.com/nvim-telescope/telescope.nvim/issues/269
-- 
return{
  'nvim-telescope/telescope.nvim',
  branch = "0.1.x",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'catppuccin',
--    "nvim-tree/nvim-web-devicons",
--    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--    "neovim/nvim-lspconfig",
    "BurntSushi/ripgrep",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    local previewers = require('telescope.previewers')

    local _bad = { '.*%.json', '.*%.lua' } -- Put all filetypes that slow you down in this array
    local bad_files = function(filepath)
      for _, v in ipairs(_bad) do
        if filepath:match(v) then
          return false
        end
      end

      return true
    end

    local new_maker = function(filepath, bufnr, opts)
      opts = opts or {}
      if opts.use_ft_detect == nil then opts.use_ft_detect = true end
      opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end

    telescope.setup({
      defaults = {
        file_ignore_patterns = {},
        buffer_previewer_maker = new_maker,
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-y>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          previewer = false,
          theme = "dropdown",
        },
        live_grep = {
          hidden = true,
        },
        grep_string = {
          hidden = true,
        },
      },
    })


    -- local cp = require("catppuccin.palettes").get_palette()
    -- local TelescopeColor = {
    --   -- TelescopeBorder = { fg = cp.blue },
    --   -- TelescopeSelectionCaret = { fg = cp.flamingo },
    --   -- TelescopeSelection = { fg = cp.text, bg = cp.surface0, bold = true},
    --   -- TelescopeMatching = { fg = cp.blue },
    --   -- TelescopePromptPrefix = { bg = cp.crust },
    --   -- TelescopePromptNormal = { bg = cp.crust},
    --   -- TelescopeResultsNormal = { bg = cp.mantle},
    --   -- TelescopePreviewNormal = { bg = cp.crust },
    --   -- TelescopePromptBorder = { bg = cp.crust, fg = cp.crust },
    --   -- TelescopeResultsBorder = { bg = cp.mantle, fg = cp.crust },
    --   -- TelescopePreviewBorder = { bg = cp.crust, fg = cp.crust },
    --   -- TelescopePromptTitle = { fg = cp.crust },
    --   -- TelescopeResultsTitle = { fg = cp.text },
    --   -- TelescopePreviewTitle = { fg = cp.crust },
    --
    --   TelescopeMatching = { fg = cp.flamingo },
    --   TelescopeSelection = { fg = cp.text, bg = cp.surface0, bold = true },
    --   TelescopePromptPrefix = { bg = cp.surface0 },
    --   TelescopePromptNormal = { bg = cp.surface0 },
    --   TelescopeResultsNormal = { bg = cp.mantle },
    --   TelescopePreviewNormal = { bg = cp.mantle },
    --   TelescopePromptBorder = { bg = cp.surface0, fg = cp.surface0 },
    --   TelescopeResultsBorder = { bg = cp.mantle, fg = cp.mantle },
    --   TelescopePreviewBorder = { bg = cp.mantle, fg = cp.mantle },
    --   TelescopePromptTitle = { bg = cp.pink, fg = cp.mantle },
    --   TelescopeResultsTitle = { fg = cp.mantle },
    --   TelescopePreviewTitle = { bg = cp.green, fg = cp.mantle },
    -- }
    --
    -- for hl, col in pairs(TelescopeColor) do
    --   vim.api.nvim_set_hl(0, hl, col)
    -- end

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
    -- vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Open recent file" })
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string n cwd" })
    vim.keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    -- vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "Open a new file" })
    -- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Open the help tags menu" })

    telescope.load_extension("fzf")
  end,
}
