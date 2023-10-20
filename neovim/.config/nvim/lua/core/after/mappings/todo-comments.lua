local base = require("utils.base")

local opts = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "TODOs: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>tt",
    rhs = ":TodoTelescope<CR>",
    options = opts.options,
    description = opts.prefix .. "TODOs in current buffer",
  },
  {
    mode = { "n" },
    lhs = "<leader>ta",
    rhs = ":TodoTelescope keywords=TODO,FIX,FIXME<CR>",
    options = opts.options,
    description = opts.prefix .. "TODOs/FIXs/FIXMEs in current buffer",
  },
})

return M
