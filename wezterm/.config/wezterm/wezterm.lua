local wezterm = require("wezterm")
local config = {}

config.color_scheme = "GitHub Dark"

config.font = wezterm.font("Comic Mono")
config.font_size = 14

config.default_prog = { "/usr/bin/fish" }

config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.hide_mouse_cursor_when_typing = true

config.cursor_blink_rate = 400
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.default_cursor_style = "BlinkingBar"

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.colors = {
  foreground = "#b3b1ad",
  background = "#0d1117",

  selection_fg = "#b3b1ad",
  selection_bg = "#163356",

  ansi = {
    "#21262d",
    "#ffa198",
    "#56d364",
    "#e3b341",
    "#79c0ff",
    "#d2a8ff",
    "#56d4dd",
    "#f0f6fc",
  },
  brights = {
    "#6e7681",
    "#fa7970",
    "#7ce38b",
    "#faa356",
    "#77bdfb",
    "#cea5fb",
    "#a2d2fb",
    "#ecf2f8",
  },
}

return config
