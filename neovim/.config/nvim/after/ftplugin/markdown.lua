local base = require("utils.base")
local plugins = require("utils.plugins")

local M = {}

if plugins.marp.is_marp() then
  base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>sp",
      rhs = plugins.marp.start_server,
      options = { noremap = true, silent = true },
      description = "Marp: Start Preview.",
    },
    {
      mode = { "n" },
      lhs = "<leader>ep",
      rhs = plugins.marp.stop_server,
      options = { noremap = true, silent = true },
      description = "Marp: End Preview.",
    },
  })
else
  base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>sp",
      rhs = ":MarkdownPreview<CR>",
      options = { noremap = true, silent = true },
      description = "Markdown: Start Preview.",
    },
    {
      mode = { "n" },
      lhs = "<leader>ep",
      rhs = ":MarkdownPreviewStop<CR>",
      options = { noremap = true, silent = true },
      description = "Markdown: End Preview.",
    },
  })
end

return M
