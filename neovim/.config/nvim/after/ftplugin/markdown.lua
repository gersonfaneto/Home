local base = require("minimal.utils.base")
local plugins = require("minimal.utils.plugins")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>sp",
    rhs = function()
      if plugins.marp.is_marp() then
        plugins.marp.start_server()
      else
        vim.cmd("MarkdownPreview")
      end
    end,
    description = "Start Preview.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ep",
    rhs = function()
      if plugins.marp.is_marp() then
        plugins.marp.stop_server()
      else
        vim.cmd("MarkdownPreviewStop")
      end
    end,
    description = "End Preview.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Markdown: " })

return M
