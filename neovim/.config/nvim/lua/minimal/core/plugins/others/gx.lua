local M = {
  "chrishrb/gx.nvim",
  cmd = { "Browse" },
  opts = {
    handler_options = {
      search_engine = "duckduckgo",
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.init()
  vim.g.netrw_nogx = 1

  utils.base.mappings.register({
    mode = { "n", "x" },
    lhs = "gb",
    rhs = ":Browse<CR>",
    options = { silent = true, noremap = true },
    description = "GX :: Browse.",
  })
end

return M
