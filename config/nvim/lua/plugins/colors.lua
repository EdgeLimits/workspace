-- inpsiration: https://github.com/augustocdias/dotfiles/blob/main/.config/nvim/lua/setup/catppuccin.lua
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local catppuccin = require("catppuccin")

		local colors = require("catppuccin.palettes").get_palette()

		local telescope_bg = colors.mantle
		local telescope_fg = telescope_bg

		catppuccin.setup({
			flavour = "mocha",
			integrations = {
				cmp = true,
				gitsigns = true,
				telescope = true,
				-- style = "nvchad",
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
				navic = {
					enabled = true,
					custom_bg = colors.mantle,
				},
				neotree = {
					enabled = true,
					show_root = true,
					transparent_panel = false,
				},
				noice = true,
				notify = true,
				nvimtree = {
					enabled = true,
					show_root = true,
					transparent_panel = false,
				},
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
			highlight_overrides = {
				all = {
					TelescopePrefix = { bg = telescope_bg, fg = telescope_fg },
					TelescopeMatching = { bg = colors.surface2, fg = colors.pink },
					TelescopeTitle = { bg = telescope_bg, fg = colors.blue },
					TelescopeNormal = { bg = telescope_bg, fg = colors.text },
					TelescopeBorder = { bg = telescope_bg, fg = telescope_fg },
					TelescopeResultsNormal = { bg = telescope_bg, fg = colors.subtext1 },
					TelescopeResultsBorder = { bg = telescope_bg, fg = telescope_fg },
					TelescopeResultsCounter = { bg = telescope_bg, fg = telescope_fg },
					TelescopeSelection = { bg = colors.surface1 },
					TelescopeSelectionCaret = { fg = colors.pink },
					TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
					TelescopePreviewNormal = { bg = colors.crust, fg = colors.subtext1 },
					-- NavicIconsFile = { fg = colors.blue, bg = lualine_bg },
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
		--
		-- catppuccin.setup({
		-- 	flavour = "mocha",
		-- 	integrations = {
		-- 		aerial = true,
		-- 		barbar = true,
		-- 		dap = {
		-- 			enabled = true,
		-- 			enable_ui = true,
		-- 		},
		-- 		dashboard = true,
		-- 		fidget = true,
		-- 		flash = true,
		-- 		gitgutter = true,
		-- 		indent_blankline = {
		-- 			enabled = true,
		-- 			colored_indent_levels = false,
		-- 		},
		-- 		leap = true,
		-- 		lsp_trouble = true,
		-- 		markdown = true,
		-- 	},
		-- })
	end,
}
