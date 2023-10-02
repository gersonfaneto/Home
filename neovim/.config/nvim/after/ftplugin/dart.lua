local mappings = require("utils.api").mappings

local M = {}

mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>fl",
    rhs = ":Telescope flutter commands<CR>",
    options = { noremap = true, silent = true },
    description = "Open Telescope Flutter Commands.",
  },
})

return M
