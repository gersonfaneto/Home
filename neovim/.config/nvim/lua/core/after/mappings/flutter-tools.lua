local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Flutter: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>fl",
    rhs = ":Telescope flutter commands<CR>",
    options = props.options,
    description = props.prefix .. "Open Telescope Flutter Commands.",
  },
})

return M
