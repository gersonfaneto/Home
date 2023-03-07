local hadSuccess, TODOComments = pcall(require, "todo-comments")
if not hadSuccess then
	return
end

local Error_Red = "#F44747"
local Warning_Orange = "#ff8800"
local Hint_Blue = "#4FC1FF"
local Perf_Purple = "#7C3AED"
local Note_Green = "#10B981"

TODOComments.setup({
	signs = true,
	sign_priority = 8,
	keywords = {
		FIX = {
			icon = "",
			color = Error_Red,
			alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
		},
		TODO = { icon = "", color = Hint_Blue, alt = { "TIP" } },
		HACK = { icon = "", color = Warning_Orange },
		WARN = { icon = "", color = Warning_Orange, alt = { "WARNING", "XXX" } },
		PERF = { icon = "", color = Perf_Purple, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "TEST" } },
		NOTE = { icon = "", color = Note_Green, alt = { "INFO" } },
	},
	highlight = {
		before = "",
		keyword = "wide",
		after = "fg",
		pattern = [[.*<(KEYWORDS)\s*:]],
		comments_only = true,
		max_line_len = 400,
		exclude = { "markdown" },
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
		},
		pattern = [[\b(KEYWORDS):]],
	},
})
