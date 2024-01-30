return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      icons_enabled = true,
      theme = "dracula",
      -- component_separators = "|",
      -- section_separators = "",
      component_separators = { left = "|", right = "|"},
      section_separators = { left = '', right = ''},
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "buffers" },
    }
  }
}
