local base = require("utils.base")
local plugins = require("utils.plugins")

local M = {}

if plugins.marp.is_marp() then
  base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>sp",
      rhs = plugins.marp.start_server,
      description = "Start Preview.",
    },
    {
      mode = { "n" },
      lhs = "<leader>ep",
      rhs = plugins.marp.stop_server,
      description = "End Preview.",
    },
  }, { options = { noremap = true, silent = true }, prefix = "Marp: " })
else
  base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>sp",
      rhs = ":MarkdownPreview<CR>",
      description = "Start Preview.",
    },
    {
      mode = { "n" },
      lhs = "<leader>ep",
      rhs = ":MarkdownPreviewStop<CR>",
      description = "End Preview.",
    },
  }, { options = { noremap = true, silent = true }, prefix = "Markdown: " })
end

return M
