local base = require("utils.base")



local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>li",
    rhs = ":LspInfo<CR>",
    description = "Open the LSP Info.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ll",
    rhs = ":LspLog<CR>",
    description = "Open the LSP Log.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ls",
    rhs = ":LspStart<CR>",
    description = "Start the LSP.",
  },
  {
    mode = { "n" },
    lhs = "<leader>lS",
    rhs = ":LspStop<CR>",
    description = "Stop the LSP.",
  },
  {
    mode = { "n" },
    lhs = "<leader>lr",
    rhs = ":LspRestart<CR>",
    description = "Restart the LSP.",
  },
}, { options = { noremap = true, silent = true }, prefix = "LSP: " })

return M
