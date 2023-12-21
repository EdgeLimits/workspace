local function load_gitignore_patterns()
    local patterns = {}
    local gitignore_path = vim.fn.getcwd() .. '/.gitignore'

    -- Read .gitignore file
    local file = io.open(gitignore_path, 'r')
    if file then
        for line in file:lines() do
            -- Ignore comments and empty lines
            if line:match("^%s*#") or line:match("^%s*$") then
                goto continue
            end

            -- Convert glob patterns to Lua patterns
            local pattern = line:gsub("%.", "%%."):gsub("%*", ".*"):gsub("%?", ".?")
            table.insert(patterns, pattern)

            ::continue::
        end
        file:close()
    end

    return patterns
end

return{
  'nvim-telescope/telescope.nvim',
  branch = "0.1.x",
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- "nvim-treesitter/nvim-treesitter",
    -- "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- "neovim/nvim-lspconfig",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        file_ignore_patterns = load_gitignore_patterns(),
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    
    vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files in cwd" })
    -- set keymaps 
    -- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
  end,
}
