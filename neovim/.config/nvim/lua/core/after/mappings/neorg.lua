local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Neorg: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>nw",
    rhs = ":Neorg workspace<CR>",
    options = props.options,
    description = props.prefix .. "Neorg - Go to the default workspace - 'Notes'.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ni",
    rhs = ":Neorg index<CR>",
    options = props.options,
    description = props.prefix .. "Neorg - Open current workspace index.",
  },
  {
    mode = { "n" },
    lhs = "<leader>nr",
    rhs = ":Neorg return<CR>",
    options = props.options,
    description = props.prefix .. "Neorg - Return to the previous point.",
  },
})

return M
