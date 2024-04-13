local M = {
  "lewis6991/gitsigns.nvim",
  cmd = { "Gitsigns" },
  event = { "BufRead", "BufNewFile" },
}

function M.config()
  local icons = utils.interface.icons.get("ui")

  local gitsigns = require("gitsigns")

  gitsigns.setup({
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = icons.BoldLineLeft,
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      change = {
        hl = "GitSignsChange",
        text = icons.BoldLineLeft,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        hl = "GitSignsDelete",
        text = icons.Triangle,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = icons.Triangle,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = icons.BoldLineLeft,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority = 6,
    status_formatter = nil,
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    yadm = { enable = false },
  })
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>tb",
    rhs = ":Gitsigns toggle_current_line_blame<CR>",
    description = "Toggle current line blame.",
  },
  {
    mode = { "n" },
    lhs = "<leader>vh",
    rhs = ":lua require('gitsigns').preview_hunk()<CR>",
    description = "View current hunk.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bf",
    rhs = ":lua require('gitsigns').blame_line({ full = true })<CR>",
    description = "Show current block blame.",
  },
  {
    mode = { "n" },
    lhs = "<leader>sb",
    rhs = ":Gitsigns stage_buffer<CR>",
    description = "Stage current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<leader>rb",
    rhs = ":Gitsigns reset_buffer<CR>",
    description = "Reset current buffer.",
  },
  {
    mode = { "n", "x" },
    lhs = "<leader>sh",
    rhs = ":Gitsigns stage_hunk<CR>",
    description = "Stage current hunk or selection.",
  },
  {
    mode = { "n", "x" },
    lhs = "<leader>rh",
    rhs = ":Gitsigns reset_hunk<CR>",
    description = "Reset current hunk or selection.",
  },
  {
    mode = { "n" },
    lhs = "<leader>uh",
    rhs = ":Gitsigns undo_stage_hunk<CR>",
    description = "Unstage current hunk.",
  },
  {
    mode = { "o", "x" },
    lhs = "ih",
    rhs = ":<C-U>Gitsigns select_hunk<CR>",
    description = "Select current hunk.",
  },
  {
    mode = { "o", "x" },
    lhs = "ah",
    rhs = ":<C-U>Gitsigns select_hunk<CR>",
    description = "Select current hunk.",
  },
  {
    mode = { "n" },
    lhs = "[h",
    rhs = function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        require("gitsigns").prev_hunk()
      end)
      return "<Ignore>"
    end,
    description = "Jump to the previous hunk.",
  },
  {
    mode = { "n" },
    lhs = "]h",
    rhs = function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        require("gitsigns").next_hunk()
      end)
      return "<Ignore>"
    end,
    description = "Jump to the next hunk.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Git Signs :: " })

return M
