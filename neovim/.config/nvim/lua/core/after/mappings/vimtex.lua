local base = require("utils.base")

local M = {}

base.mappings.bulk_register({
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
}, { options = { noremap = true, silent = true }, prefix = "LaTeX: " })

return M
