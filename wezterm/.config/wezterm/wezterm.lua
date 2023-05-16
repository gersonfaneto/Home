local wezterm = require("wezterm")
local config = {}

config.color_scheme = "GitHub Dark"

config.font = wezterm.font("Comic Mono")
config.font_size = 14

config.default_prog = { "/bin/fish" }

config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.hide_mouse_cursor_when_typing = true

return config
