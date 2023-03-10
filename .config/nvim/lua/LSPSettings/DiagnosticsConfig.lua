local VimDiagnostic = vim.diagnostic.config
local signDefine = vim.fn.sign_define

VimDiagnostic({
  virtual_text = true,
  float = {
    focusable = true,
    style = "minimal",
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    source = "always",
    header = "",
    prefix = "",
  },
})

signDefine("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
signDefine("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
signDefine("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
signDefine("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
