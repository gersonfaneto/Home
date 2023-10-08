return {
  "sindrets/diffview.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local base = require("utils.base")

    local opts = { silent = true, noremap = true }

    base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>do",
        rhs = ":DiffviewOpen<CR>",
        options = opts,
        description = "Open diff view.",
      },
      {
        mode = { "n" },
        lhs = "<leader>dc",
        rhs = ":DiffviewClose<CR>",
        options = opts,
        description = "Close diff view.",
      },
      {
        mode = { "n" },
        lhs = "<leader>dh",
        rhs = ":DiffviewFileHistory<CR>",
        options = opts,
        description = "Open diff history.",
      },
    })
  end,
}
