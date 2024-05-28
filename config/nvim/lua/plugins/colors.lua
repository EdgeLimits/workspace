-- https://github.com/catppuccin/nvim
-- inpsiration: https://github.com/augustocdias/dotfiles/blob/main/.config/nvim/lua/setup/catppuccin.lua
return {
  "catppuccin/nvim", name = "catppuccin", priority = 1000,
  config = function ()
    local catppuccin = require("catppuccin");
    local colors = require("catppuccin.palettes").get_palette()
    local ucolors = require('catppuccin.utils.colors')
    local lualine_bg = colors.mantle
    local telescope_prompt = ucolors.darken(colors.crust, 0.95, '#000000')
    local telescope_results = ucolors.darken(colors.mantle, 0.95, '#000000')
    local telescope_text = colors.text
    local telescope_prompt_title = colors.sky
    local telescope_preview_title = colors.teal
    catppuccin.setup({
      integrations = {
        aerial = true,
        barbar = true,
        cmp = true,
        dap = {
          enabled = true,
          enable_ui = true,
        },
        dashboard = true,
        fidget = true,
        flash = true,
        gitgutter = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        leap = true,
        lsp_trouble = true,
        markdown = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
          },
        },
        navic = {
          enabled = true,
          custom_bg = lualine_bg,
        },
        neogit = true,
        neotest = true,
        neotree = {
          enabled = true,
          show_root = true,
          transparent_panel = false,
        },
        noice = true,
        notify = true,
        octo = true,
        overseer = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
      highlight_overrides = {
        all = {
          -- NoiceCmdlinePopup = { bg = ucolors.lighten(colors.flamingo, 0.1, '#FFFFFF') },
          -- NoiceMini = { bg = colors.mantle },
          -- WinBar = { bg = lualine_bg },
          -- WinBarSigActParm = { fg = colors.blue, bg = lualine_bg },
          -- WinBarSignature = { fg = colors.flamingo, bg = lualine_bg },
          -- dims the text so that the hits are more visible
          -- LeapBackdrop = { fg = colors.flamingo },
          -- TelescopeBorder = { bg = telescope_results, fg = telescope_results },
          -- TelescopePromptBorder = { bg = telescope_prompt, fg = telescope_prompt },
          -- TelescopePromptCounter = { fg = telescope_text },
          -- TelescopePromptNormal = { fg = telescope_text, bg = telescope_prompt },
          -- TelescopePromptPrefix = { fg = telescope_prompt_title, bg = telescope_prompt },
          -- TelescopePromptTitle = { fg = telescope_prompt, bg = telescope_prompt_title },
          -- TelescopePreviewTitle = { fg = telescope_results, bg = telescope_preview_title },
          -- TelescopePreviewBorder = {
          --   bg = ucolors.darken(telescope_results, 0.95, '#000000'),
          --   fg = ucolors.darken(telescope_results, 0.95, '#000000'),
          -- },
          -- TelescopePreviewNormal = {
          --   bg = ucolors.darken(telescope_results, 0.95, '#000000'),
          --   fg = telescope_results,
          -- },
          -- TelescopeResultsTitle = { fg = telescope_results, bg = telescope_preview_title },
          -- TelescopeMatching = { fg = telescope_prompt_title },
          -- TelescopeNormal = { bg = telescope_results },
          -- TelescopeSelection = { bg = telescope_prompt },
          -- TelescopeSelectionCaret = { fg = telescope_text },
          -- TelescopeResultsNormal = { bg = telescope_results },
          -- TelescopeResultsBorder = { bg = telescope_results, fg = telescope_results },
          -- NavicIconsFile = { fg = colors.blue, bg = lualine_bg },
        },
      },
    })
  end,
}
