---@diagnostic disable: undefined-global

local api = require("utils.api")

local M = {}

function M.before()
  M.register_key()
end

function M.load()
  vim.g.nvim_markdown_preview_theme = "github"
  vim.g.nvim_markdown_preview_format = "markdown"
end

function M.after() end

function M.register_key()
  api.maps.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>mp",
      rhs = ":MarkdownPreview<CR>",
      options = { noremap = true, silent = true },
      description = "Markdown Preview.",
    },
  })
end

return M
