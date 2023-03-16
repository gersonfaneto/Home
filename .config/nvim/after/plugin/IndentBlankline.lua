local pCall = require("Utils.ProtectedCall")

local IndentBlankline = pCall("indent_blankline")

IndentBlankline.setup({
  show_trailing_blankline_indent = false,
  char = "┊",
})
