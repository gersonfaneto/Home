local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Git Signs: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>tb",
    rhs = ":Gitsigns toggle_current_line_blame<CR>",
    options = props.options,
    description = props.prefix .. "Toggle current line blame.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ph",
    rhs = ":lua require('gitsigns').preview_hunk()<CR>",
    options = props.options,
    description = props.prefix .. "Preview current hunk.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bf",
    rhs = ":lua require('gitsigns').blame_line{full=true}<CR>",
    options = props.options,
    description = props.prefix .. "Show current block blame.",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>rh",
    rhs = ":Gitsigns reset_hunk<CR>",
    options = props.options,
    description = props.prefix .. "Reset current hunk.",
  },
  {
    mode = { "n" },
    lhs = "<leader>rb",
    rhs = ":Gitsigns reset_buffer<CR>",
    options = props.options,
    description = props.prefix .. "Reset current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<leader>sh",
    rhs = ":Gitsigns stage_hunk<CR>",
    options = props.options,
    description = props.prefix .. "Stage current hunk.",
  },
  {
    mode = { "v" },
    lhs = "<leader>sh",
    rhs = ":VisualStage<CR>",
    options = props.options,
    description = props.prefix .. "Stage current visual selection.",
  },
  {
    mode = { "n" },
    lhs = "<leader>uh",
    rhs = ":Gitsigns undo_stage_hunk<CR>",
    options = props.options,
    description = props.prefix .. "Unstage current hunk.",
  },
  {
    mode = { "n" },
    lhs = "[c",
    rhs = function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end,
    options = props.options,
    description = props.prefix .. "Jump to the previous hunk.",
  },
  {
    mode = { "n" },
    lhs = "]c",
    rhs = function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end,
    options = props.options,
    description = props.prefix .. "Jump to the next hunk.",
  },
})

return M
