local pCall = require("Utils.ProtectedCall")

local TODOComments = pCall("todo-comments")

local Error_Red = "#EA4A5A"
local Warning_Orange = "#FFEA7F"
local Hint_Blue = "#2188FF"
local Perf_Purple = "#B392F0"
local Note_Green = "#34D058"

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
