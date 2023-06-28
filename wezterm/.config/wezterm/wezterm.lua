local wezterm = require("wezterm")

wezterm.on("toggleOpacity", function(window, _)
	local overrides = window:get_config_overrides() or {}

	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.7
	else
		overrides.window_background_opacity = nil
	end

	window:set_config_overrides(overrides)
end)

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

	window_decorations = "NONE",
	hide_tab_bar_if_only_one_tab = true,
	hide_mouse_cursor_when_typing = true,

	keys = {
		{
			key = "F11",
			mods = "NONE",
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = "F12",
			mods = "NONE",
			action = wezterm.action.EmitEvent("toggleOpacity"),
		},
	},

	default_prog = { "/usr/bin/fish" },
}
