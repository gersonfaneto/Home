local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "LaTeX: ",
}

local M = {}

base.mappings.register({
  mode = { "n" },
  lhs = "<leader>sp",
  rhs = ":VimtexCompile<CR>",
  options = { noremap = true, silent = true },
  description = "LaTeX: Start Preview.",
})

return M
