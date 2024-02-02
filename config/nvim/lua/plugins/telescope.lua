-- brew install ripgrep
-- 
return{
  'nvim-telescope/telescope.nvim',
  branch = "0.1.x",
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- "neovim/nvim-lspconfig",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {},
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      -- pickers = {
      --   find_files = {
      --     theme = "dropdown",
      --   }
      -- },
    })

    telescope.load_extension("fzf")
  end,
}
-- local function load_gitignore_patterns()
--     local patterns = {}
--     local gitignore_path = vim.fn.getcwd() .. '/.gitignore'
--
--     -- Read .gitignore file
--     local file = io.open(gitignore_path, 'r')
--     if file then
--         for line in file:lines() do
--             -- Ignore comments and empty lines
--             if line:match("^%s*#") or line:match("^%s*$") then
--                 goto continue
--             end
--
--             -- Convert glob patterns to Lua patterns
--             local pattern = line:gsub("%.", "%%."):gsub("%*", ".*"):gsub("%?", ".?")
--             table.insert(patterns, pattern)
--
--             ::continue::
--         end
--         file:close()
--     end
--
--     return patterns
-- end
