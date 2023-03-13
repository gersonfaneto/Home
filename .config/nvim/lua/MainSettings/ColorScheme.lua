local hadSuccess, GitHub_Theme = pcall(require, "github-theme")

if not hadSuccess then
  return
end

GitHub_Theme.setup({
  theme_style = "dark_default",
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
