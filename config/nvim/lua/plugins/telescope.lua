-- Large JSON file solution: https://github.com/nvim-telescope/telescope.nvim/issues/269
-- 
return{
  'nvim-telescope/telescope.nvim',
  branch = "0.1.x",
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "neovim/nvim-lspconfig",
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
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          -- hidden = true,
          -- theme = "dropdown",
        }
      },
    })

    telescope.load_extension("fzf")
  end,
}
