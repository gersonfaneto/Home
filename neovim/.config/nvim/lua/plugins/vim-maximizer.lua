return {
  "szw/vim-maximizer",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local api = require("utils.api")

    api.mappings.register({
      mode = { "n" },
      lhs = "<leader>m",
      rhs = ":MaximizerToggle<CR>",
      options = { silent = true, noremap = true },
      description = "Maximize/Minimize current split.",
    })
  end,
}
