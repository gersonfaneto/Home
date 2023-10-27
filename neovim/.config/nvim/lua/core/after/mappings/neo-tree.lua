local base = require("utils.base")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "NeoTree: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>nt",
    rhs = ":Neotree toggle<CR>",
    options = props.options,
    description = props.prefix .. "Opene",
  },
  {
    mode = { "n" },
    lhs = "<leader>nf",
    rhs = ":Neotree focus<CR>",
    options = props.options,
    description = props.prefix .. "Focus.",
  },
})

return M
