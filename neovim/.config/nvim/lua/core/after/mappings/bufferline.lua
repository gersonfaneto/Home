local base = require("utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>bd",
    rhs = ":BufferDelete<CR>",
    description = "Delete the current Buffer while maintaining the window layout.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bq",
    rhs = ":BufferLinePickClose<CR>",
    description = "Close target buffer.",
  },
  {
    mode = { "n" },
    lhs = "<Tab>",
    rhs = ":BufferLineCycleNext<CR>",
    description = "Cycle to next buffer.",
  },
  {
    mode = { "n" },
    lhs = "<S-Tab>",
    rhs = ":BufferLineCyclePrev<CR>",
    description = "Cycle to previous buffer.",
  },
  {
    mode = { "n" },
    lhs = "<C-h>",
    rhs = ":BufferLineMovePrev<CR>",
    description = "Move current buffer to left.",
  },
  {
    mode = { "n" },
    lhs = "<C-l>",
    rhs = ":BufferLineMoveNext<CR>",
    description = "Move current buffer to right.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bh",
    rhs = ":BufferLineCloseLeft<CR>",
    description = "Close all left buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bl",
    rhs = ":BufferLineCloseRight<CR>",
    description = "Close all right buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bo",
    rhs = function()
      vim.cmd("BufferLineCloseLeft")
      vim.cmd("BufferLineCloseRight")
    end,
    description = "Close all other buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ba",
    rhs = function()
      vim.cmd("BufferLineCloseLeft")
      vim.cmd("BufferLineCloseRight")
      vim.cmd("BufferDelete")
    end,
    description = "Close all buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bt",
    rhs = ":BufferLinePick<CR>",
    description = "Go to buffer *.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bs",
    rhs = ":BufferLineSortByExtension<CR>",
    description = "Buffers sort (by extension).",
  },
}, { options = { noremap = true, silent = true }, prefix = "BufferLine: " })

return M
