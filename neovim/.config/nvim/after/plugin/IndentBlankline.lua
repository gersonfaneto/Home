local pCall = require("Utils.ProtectedCall")
local vCMD = vim.cmd

local IndentBlankline = pCall("indent_blankline")

vCMD("highlight IndentBlanklineIndent guifg=#4d5566 gui=nocombine")

IndentBlankline.setup({
  show_trailing_blankline_indent = false,
  char = "┊",
  char_highlight_list = {
        "IndentBlanklineIndent",
  },
})

