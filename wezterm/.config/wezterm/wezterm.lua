---@diagnostic disable: unused-local

local wezterm = require("wezterm")

local Gruvbox = "Gruvbox Material (Gogh)"
local Catppuccin = "Catppuccin Mocha"

return {
	color_scheme = Catppuccin,

	colors = {
		background = "#0d1117",
	},

	font = wezterm.font("Comic Mono"),
	font_size = 10,

	cursor_blink_rate = 400,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	default_cursor_style = "BlinkingBlock",

	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},
  window_background_opacity = 0.0,

	window_decorations = "NONE",
	hide_tab_bar_if_only_one_tab = true,
	hide_mouse_cursor_when_typing = true,

	default_prog = { "/usr/bin/fish" },
}
