local M = {
  "cshuaimin/ssr.nvim",
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  M.helpers.register_mappings()
end

M.helpers = {
  register_mappings = function()
    utils.base.mappings.register({
      mode = { "n", "x" },
      lhs = "<leader>sr",
      rhs = ":lua require('ssr').open()<CR>",
      options = { noremap = true, silent = true },
      description = "SSR :: Open Window.",
    })
  end,
}

return M
