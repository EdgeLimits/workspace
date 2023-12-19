-- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt

return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.g.nvim_tree_show_icons = {
      git = 0,
      folders = 1,
      files = 1,
      folder_arrows = 0,
    }

    nvimtree.setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          git_placement = "after",
          modified_placement = "after",
          diagnostics_placement = "signcolumn",
          bookmarks_placement = "signcolumn",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = false,
            git = false,
            modified = true,
            diagnostics = true,
            bookmarks = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
}
