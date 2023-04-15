local pCall = require("Utils.ProtectedCall")

local GitHub_Theme = pCall("github-theme")

GitHub_Theme.setup({
  options = {
    transparent = false,
    hide_end_of_buffer = true,
    hide_nc_statusline = true,
    styles = {
      comments = "Italic",
      functions = "NONE",
      keywords = "Bold",
      variables = "Underline",
    },
    darken = {
      floats = true,
      sidebars = {
        enable = true,
        list = { "qf", "vista_kind", "terminal", "packer" },
      },
    },
  },

  colors = { hint = "orange", error = "#ff0000" },

  overrides = function(c)
    return {
      htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
      DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
      TSField = {},
    }
  end,
})

vim.cmd("colorscheme github_dark_default")
