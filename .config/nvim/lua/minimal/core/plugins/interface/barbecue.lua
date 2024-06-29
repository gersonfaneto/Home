local M = {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
  },
  opts = {
    theme = "auto",
    show_dirname = false,
    show_modified = true,
  },
}

function M.init()
  utils.base.mappings.register({
    mode = { "n" },
    lhs = "<leader>bt",
    rhs = ":Barbecue toggle<CR>",
    options = { silent = true, noremap = true },
    description = "Barbecue :: Toggle.",
  })
end

return M
