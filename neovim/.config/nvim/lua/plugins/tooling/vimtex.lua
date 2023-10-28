return {
  "lervag/vimtex",
  ft = {
    "tex",
    "latex",
    "plaintext",
  },
  config = function()
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "out",
    }
  end,
}
