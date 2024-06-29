local M = {
  "uga-rosa/ccc.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
}

function M.init()
  utils.base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>cp",
      rhs = ":CccPick<CR>",
      description = "Open Color Picker.",
    },
    {
      mode = { "n" },
      lhs = "<leader>ct",
      rhs = ":CccHighlighterToggle<CR>",
      description = "Toggle Color Highlighter.",
    },
    {
      mode = { "n" },
      lhs = "<leader>cc",
      rhs = ":CccConvert<CR>",
      description = "Convert Color.",
    },
  }, { options = { noremap = true, silent = true }, prefix = "CCC :: " })
end

function M.config()
  local ccc = require("ccc")

  ccc.setup({
    highlighter = {
      auto_enable = true,
      lsp = true,
      excludes = {
        "lazy",
        "mason",
        "help",
        "neo-tree",
      },
    },
  })
end

return M
