local wezterm = require("wezterm")

return {
	color_scheme = "Gruvbox Material (Gogh)",

	colors = {
		background = "#0d1117",
	},

	font = wezterm.font("Comic Mono"),
	font_size = 14,

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
  window_background_opacity = 0.7,

	window_decorations = "NONE",
	hide_tab_bar_if_only_one_tab = true,
	hide_mouse_cursor_when_typing = true,

	default_prog = { "/usr/bin/fish" },
}
