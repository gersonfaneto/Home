local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "LaTeX: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>sp",
    rhs = ":VimtexCompile<CR>",
    options = props.options,
    description = props.prefix .. "Start Preview.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ep",
    rhs = function()
      vim.cmd("VimtexStopAll")
      vim.cmd("VimtexClean")
    end,
    options = props.options,
    description = props.prefix .. "End Preview.",
  },
})

return M
