local M = {
  "lervag/vimtex",
  ft = { "tex", "bib" },
}

function M.config()
  vim.g.vimtex_view_method = "zathura"
  vim.g.vimtex_quickfix_mode = 0

  vim.g.vimtex_mappings_enabled = 0
  vim.g.vimtex_indent_enabled = 0
  vim.g.vimtex_syntax_enabled = 0

  vim.g.vimtex_compiler_latexmk = {
    out_dir = "out",
  }

  vim.g.vimtex_log_ignore = {
    "Underfull",
    "Overfull",
    "specifier changed to",
    "Token not allowed in a PDF string",
  }

  M.handlers.register_mappings()
end

M.handlers = {
  register_mappings = function()
    utils.base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>sp",
        rhs = ":VimtexCompile<CR>",
        description = "Start Preview.",
      },
      {
        mode = { "n" },
        lhs = "<leader>ep",
        rhs = function()
          vim.cmd("VimtexStopAll")
          vim.cmd("VimtexClean")
        end,
        description = "End Preview.",
      },
    }, { options = { noremap = true, silent = true }, prefix = "LaTeX :: " })
  end,
}

return M
