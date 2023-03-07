local hadSuccess, Colorizer = pcall(require, "colorizer")
if not hadSuccess then
	return
end

Colorizer.setup({
	user_default_options = {
		RGB = true,
		RRGGBB = true,
		names = true,
		RRGGBBAA = false,
		AARRGGBB = false,
		rgb_fn = false,
		hsl_fn = false,
		css = false,
		css_fn = false,
		mode = "virtualtext",
		tailwind = true,
		virtualtext = "■",
	},
})
