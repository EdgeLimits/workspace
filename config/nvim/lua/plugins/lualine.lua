return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "dracula",
      component_separators = "|",
      section_separators = "",
      -- component_separators = { left = "|", right = "|"},
      -- section_separators = { left = '', right = ''},
    },
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
