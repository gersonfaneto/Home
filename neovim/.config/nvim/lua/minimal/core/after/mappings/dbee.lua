local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>Do",
    rhs = ":lua require('dbee').open()<CR>",
    description =  "Open UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dc",
    rhs = ":lua require('dbee').close()<CR>",
    description =  "Close UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dt",
    rhs = ":lua require('dbee').toggle()<CR>",
    description =  "Toggle UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dn",
    rhs = ":lua require('dbee').next()<CR>",
    description =  "Go to next result page.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dp",
    rhs = ":lua require('dbee').prev()<CR>",
    description =  "Go to previous result page.",
  },
}, { options = { silent = true, noremap = true }, prefix = "DB: " })

return M
