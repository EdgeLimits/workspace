local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
-- custom.background = "#000000"

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
	default_cursor_style = "BlinkingBar",
	color_scheme = "Catppuccin Mocha",
	-- color_scheme = {
	-- 	["OLEDpuccin"] = custom,
	-- },
	-- color_scheme = "OLEDpuccin",
	-- font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	font = wezterm.font("JetBrains Mono"),
	font_size = 14,
	line_height = 1.05,
	window_padding = {
		left = 8,
		right = 8,
		top = 8,
		bottom = 8,
	},
	-- background = { },
	-- window_background_opacity = 1,
	window_frame = {
		border_left_width = "0.2cell",
		border_right_width = "0.2cell",
		border_bottom_height = "0.1cell",
		border_top_height = "0.1cell",
		border_left_color = "black",
		border_right_color = "black",
		border_bottom_color = "black",
		border_top_color = "black",
	},
}

return config
