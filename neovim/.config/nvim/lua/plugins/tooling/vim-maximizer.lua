return {
  "szw/vim-maximizer",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local base = require("utils.base")

    base.mappings.register({
      mode = { "n" },
      lhs = "<leader>m",
      rhs = ":MaximizerToggle<CR>",
      options = { silent = true, noremap = true },
      description = "Maximize/Minimize current split.",
    })
  end,
}
