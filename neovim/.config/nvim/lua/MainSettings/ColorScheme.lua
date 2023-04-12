local pCall = require("Utils.ProtectedCall")

local GitHub_Theme = pCall("github-theme")

GitHub_Theme.setup({
  transparent = true,
  dark_float = false,
  dark_sidebar = false,
  comment_style = "italic",
  keyword_style = "italic",
  function_style = "italic",
  variable_style = "italic",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },
  colors = {
    hint = "orange",
    error = "#ff0000",
  },
  overrides = function(c)
    return {
      htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
      DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
      TSField = {},
    }
  end,
})

vim.cmd[[ colorscheme github_dark_default ]]
