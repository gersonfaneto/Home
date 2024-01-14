local M = {
  "hedyhli/outline.nvim",
  cmd = { "Outline", "OutlineOpen" },
}

function M.config()
  local outline = require("outline")

  outline.setup()
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>so",
    rhs = ":Outline<CR>",
    description = "Toggle.",
  },
}, { prefix = "Outline: ", options = { noremap = true, silent = true } })

return M
