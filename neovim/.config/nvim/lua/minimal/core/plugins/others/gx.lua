local M = {
  ["gx.nvim"] = {
    "chrishrb/gx.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Browse" },
    opts = {},
  },
  helpers = {},
}

M["gx.nvim"].init = function()
  vim.g.netrw_nogx = 1

  M.helpers.register_mappings()
end

M.helpers = {
  register_mappings = function()
    utils.base.mappings.register({
      mode = { "n", "x" },
      lhs = "gx",
      rhs = ":Browse<CR>",
      options = { silent = true, noremap = true },
      description = "GX :: Browse.",
    })
  end,
}

return M["gx.nvim"]
