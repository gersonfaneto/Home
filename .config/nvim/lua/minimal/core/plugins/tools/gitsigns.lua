local M = {
  "lewis6991/gitsigns.nvim",
  cmd = { "Gitsigns" },
  event = { "BufRead", "BufNewFile" },
}

local icons = utils.interface.icons.get("ui")

M.opts = {
  signs = {
    add = {
      text = icons.BoldLineLeft,
    },
    change = {
      text = icons.BoldLineLeft,
    },
    delete = {
      text = icons.TriangleShortArrowRight,
    },
    topdelete = {
      text = icons.TriangleShortArrowUp,
    },
    changedelete = {
      text = icons.BoldLineLeft,
    },
  },
  preview_config = {
    border = "rounded",
  },
  on_attach = function(bufnr)
    utils.base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>tb",
        rhs = ":Gitsigns toggle_current_line_blame<CR>",
        description = "Toggle current line blame.",
      },
      {
        mode = { "n" },
        lhs = "<leader>ph",
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
        lhs = "[[",
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
        lhs = "]]",
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
    }, { options = { noremap = true, silent = true, buffer = bufnr }, prefix = "Git Signs :: " })
  end,
}

return M
