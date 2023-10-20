local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Buffers: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>bd",
    rhs = ":BufferDelete<CR>",
    options = props.options,
    description = props.prefix .. "Delete the current Buffer while maintaining the window layout.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bq",
    rhs = ":BufferLinePickClose<CR>",
    options = props.options,
    description =  props.prefix .. "Close target buffer.",
  },
  {
    mode = { "n" },
    lhs = "<Tab>",
    rhs = ":BufferLineCycleNext<CR>",
    options = props.options,
    description =  props.prefix .. "Cycle to next buffer.",
  },
  {
    mode = { "n" },
    lhs = "<S-Tab>",
    rhs = ":BufferLineCyclePrev<CR>",
    options = props.options,
    description =  props.prefix .. "Cycle to previous buffer.",
  },
  {
    mode = { "n" },
    lhs = "<C-h>",
    rhs = ":BufferLineMovePrev<CR>",
    options = props.options,
    description =  props.prefix .. "Move current buffer to left.",
  },
  {
    mode = { "n" },
    lhs = "<C-l>",
    rhs = ":BufferLineMoveNext<CR>",
    options = props.options,
    description =  props.prefix .. "Move current buffer to right.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bh",
    rhs = ":BufferLineCloseLeft<CR>",
    options = props.options,
    description =  props.prefix .. "Close all left buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bl",
    rhs = ":BufferLineCloseRight<CR>",
    options = props.options,
    description =  props.prefix .. "Close all right buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bo",
    rhs = function()
      vim.cmd("BufferLineCloseLeft")
      vim.cmd("BufferLineCloseRight")
    end,
    options = props.options,
    description =  props.prefix .. "Close all other buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ba",
    rhs = function()
      vim.cmd("BufferLineCloseLeft")
      vim.cmd("BufferLineCloseRight")
      vim.cmd("BufferDelete")
    end,
    options = props.options,
    description =  props.prefix .. "Close all buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bt",
    rhs = ":BufferLinePick<CR>",
    options = props.options,
    description =  props.prefix .. "Go to buffer *.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bs",
    rhs = ":BufferLineSortByExtension<CR>",
    options = props.options,
    description =  props.prefix .. "Buffers sort (by extension).",
  },
})

return M
