local base = require("utils.base")

local rest_nvim = require("rest-nvim")

local props = {
  options = {
    silent = true,
    noremap = true,
    buffer = base.buffers.bufnr(),
  },
  prefix = "REST: ",
}

local M = {}

base.mappings.bulk_register({
  {

    mode = "n",
    lhs = "<leader>hr",
    rhs = rest_nvim.run,
    options = props.options,
    description = props.prefix .. "Run request under cursor.",
  },
  {

    mode = "n",
    lhs = "<leader>hl",
    rhs = rest_nvim.last,
    options = props.options,
    description = props.prefix .. "Run last request.",
  },
  {

    mode = "n",
    lhs = "<leader>hp",
    rhs = function()
      rest_nvim.run(true)
    end,
    options = props.options,
    description = props.prefix .. "Preview request under cursor.",
  },
})

return M
