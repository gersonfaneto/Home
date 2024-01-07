local M = {
  "dnlhc/glance.nvim",
  cmd = { "Glance" },
}

function M.config()
  local glance = require("glance")

  glance.setup({
    hooks = {
      before_open = function(results, open, jump, _)
        if #results == 1 then
          jump(results[1])
        else
          open(results)
        end
      end,
    },
  })
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "gD",
    rhs = ":Glance definitions<CR>",
    description = "View definitions.",
  },
  {
    mode = { "n" },
    lhs = "gR",
    rhs = ":Glance references<CR>",
    description = "View references.",
  },
  {
    mode = { "n" },
    lhs = "gY",
    rhs = ":Glance type_definitions<CR>",
    description = "View type definitions.",
  },
  {
    mode = { "n" },
    lhs = "gI",
    rhs = ":Glance implementations<CR>",
    description = "View implementations.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Glance: " })

return M
