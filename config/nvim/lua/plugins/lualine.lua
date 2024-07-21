return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"smiteshp/nvim-navic",
	},
	config = function()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "catppuccin-mocha",
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{
						"diff",
						colored = true, -- Displays a colored diff status if set to true
						-- diff_color = {
						--   -- Same color values as the general color option can be used here.
						--   added    = 'LuaLineDiffAdd',    -- Changes the diff's added color
						--   modified = 'LuaLineDiffChange', -- Changes the diff's modified color
						--   removed  = 'LuaLineDiffDelete', -- Changes the diff's removed color you
						-- },
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						}, -- Changes the symbols used by the diff.
						source = nil, -- A function that works as a data source for diff.
						-- It must return a table as such:
						--   { added = add_count, modified = modified_count, removed = removed_count }
						-- or nil on failure. count <= 0 won't be displayed.
					},
					"diagnostics",
				},
				lualine_c = {},
				-- lualine_c = {'filename'},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "searchcount", "progress" },
				lualine_z = { "location" },
			},
			-- inactive_sections = {
			--   lualine_a = {},
			--   lualine_b = {},
			--   lualine_c = {'filename'},
			--   lualine_x = {'location'},
			--   lualine_y = {},
			--   lualine_z = {},
			-- },
			-- tabline = {
			--   lualine_a = {},
			--   lualine_b = {},
			--   lualine_c = {},
			--   lualine_x = {},
			--   lualine_y = {},
			--   lualine_z = {},
			-- },
			winbar = {
				lualine_c = {},
				lualine_b = {
					{
						"navic",
						color_corection = nil,
						navic_opts = {
							highlight = true,
							draw_empty = true,
						},
					},
				},
				lualine_a = {
					{
						"filename",
						path = 0,
						file_status = true,
						symbols = {
							modified = "", -- Text to show when the file is modified.
							readonly = "", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "󰇘", -- Text to show for unnamed buffers.
							newfile = "", -- Text to show for newly created file before first write
						},
					},
				},
				lualine_x = {},
				lualine_y = { {
					"filename",
					path = 1,
					file_status = false,
				} },
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_c = {},
				lualine_b = {},
				lualine_a = {
					{
						"navic",
						color_corection = nil,
						navic_opts = {
							highlight = true,
							draw_empty = true,
						},
					},
				},
				lualine_x = {},
				lualine_y = { {
					"filename",
					path = 1,
					file_status = false,
				} },
				lualine_z = {
					{
						"filename",
						path = 0,
						file_status = true,
						symbols = {
							modified = "", -- Text to show when the file is modified.
							readonly = "", -- Text to show when the file is non-modifiable or readonly.
							unnamed = "󰇘", -- Text to show for unnamed buffers.
							newfile = "", -- Text to show for newly created file before first write
						},
					},
				},
			},
			extensions = {},
		})
	end,
}
