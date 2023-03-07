local hadSuccess, IndentBlankline = pcall(require, "indent_blankline")
if not hadSuccess then
	return
end

IndentBlankline.setup({
	show_trailing_blankline_indent = false,
	char = "┊",
})
