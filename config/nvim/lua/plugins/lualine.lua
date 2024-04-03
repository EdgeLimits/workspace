return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "catppuccin-mocha",
      component_separators = "|",
      section_separators = "",
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'searchcount', 'progress'},
      lualine_z = {'location'},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {},
    },
    -- tabline = {
      -- lualine_a = {},
      -- lualine_b = {},
      -- lualine_c = {},
      -- lualine_x = {},
      -- lualine_y = {},
      -- lualine_z = {},
    -- },
    -- winbar = {
    --   lualine_a = {'buffers'},
    --   lualine_b = {},
    --   lualine_c = {},
    --   lualine_x = {},
    --   lualine_y = {},
    --   lualine_z = {},
    -- },
    inactive_winbar = {},
    extensions = {},
    -- sections = {
      -- lualine_x = {
      --   {
      --     require("noice").api.statusline.mode.get,
      --     cond = require("noice").api.statusline.mode.has,
      --     color = { fg = "#ff9e64" },
      --   }
      -- },
      -- lualine_a = { "mode" },
      -- lualine_b = { "buffers" },
    -- }
  }
}
