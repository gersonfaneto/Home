return {
  "lervag/vimtex",
  ft = {
    "tex",
    "latex",
    "plaintext",
  },
  config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 0

    vim.g.vimtex_mappings_enabled = 0
    vim.g.vimtex_indent_enabled = 0
    vim.g.vimtex_syntax_enabled = 0

    vim.g.vimtex_compiler_latexmk = {
      build_dir = "out",
    }

    vim.g.vimtex_log_ignore = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
    }
  end,
}
