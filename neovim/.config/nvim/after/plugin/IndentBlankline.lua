local pCall = require("Utils.ProtectedCall")
local vCMD = vim.cmd

local IndentBlankline = pCall("indent_blankline")

vCMD("highlight IndentBlanklineIndent1 guifg=#FA7970 gui=nocombine")
vCMD("highlight IndentBlanklineIndent2 guifg=#FAA356 gui=nocombine")
vCMD("highlight IndentBlanklineIndent3 guifg=#7CE38B gui=nocombine")
vCMD("highlight IndentBlanklineIndent4 guifg=#77BDFB gui=nocombine")
vCMD("highlight IndentBlanklineIndent5 guifg=#A2D2FB gui=nocombine")
vCMD("highlight IndentBlanklineIndent6 guifg=#CEA5FB gui=nocombine")

IndentBlankline.setup({
  show_trailing_blankline_indent = false,
  char = "┊",
  char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
  },
})

