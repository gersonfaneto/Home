local base = require("utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>fl",
    rhs = ":Telescope flutter commands<CR>",
    description = "Open Telescope Flutter Commands.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Flutter Tools: " })

return M
