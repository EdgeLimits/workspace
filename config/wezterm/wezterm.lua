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
	window_padding = {
		left = 4,
		right = 4,
		top = 4,
		bottom = 4,
	},
  -- background = { },
  -- window_background_opacity = 1,
}

return config
