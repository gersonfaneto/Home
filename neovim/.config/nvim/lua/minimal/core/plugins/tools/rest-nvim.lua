local M = {
  "rest-nvim/rest.nvim",
  ft = { "http" },
}

function M.config()
  M.helpers.register_mappings()
end

M.helpers = {
  register_mappings = function()
    utils.base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>rr",
        rhs = "<Plug>RestNvim<CR>",
        description = "Run current request.",
      },
      {
        mode = { "n" },
        lhs = "<leader>rl",
        rhs = "<Plug>RestNvimLast<CR>",
        description = "Run last request.",
      },
      {
        mode = { "n" },
        lhs = "<leader>rp",
        rhs = "<Plug>RestNvimPreview<CR>",
        description = "Preview current request.",
      },
    }, { prefix = "Rest: ", options = { silent = true, noremap = true } })
  end,
}

return M
