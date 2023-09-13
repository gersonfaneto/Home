local mappings = require("utils.api").mappings

local opts = { noremap = true, silent = true }

local M = {}

mappings.bulk_register({
  -- Alpha.
  {
    mode = { "n" },
    lhs = "<leader>ma",
    rhs = ":Alpha<CR>",
    options = opts,
    description = "Open Alpha.",
  },
  -- Lazy.
  {
    mode = { "n" },
    lhs = "<leader>lh",
    rhs = ":Lazy<CR>",
    options = opts,
    description = "Open Lazy.",
  },
  -- Mason.
  {
    mode = { "n" },
    lhs = "<leader>ms",
    rhs = ":Mason<CR>",
    options = opts,
    description = "Open Mason.",
  },
  -- Copilot.
  {
    mode = { "n" },
    lhs = "<leader>ct",
    rhs = ":Copilot toggle<CR>",
    options = opts,
    description = "Toggle Copilot.",
  },
  -- LSP.
  {
    mode = { "n" },
    lhs = "<leader>li",
    rhs = ":LspInfo<CR>",
    options = opts,
    description = "Open the LSP Info.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ls",
    rhs = ":LspStart<CR>",
    options = opts,
    description = "Start the LSP.",
  },
  {
    mode = { "n" },
    lhs = "<leader>lS",
    rhs = ":LspStop<CR>",
    options = opts,
    description = "Stop the LSP.",
  },
  {
    mode = { "n" },
    lhs = "<leader>lr",
    rhs = ":LspRestart<CR>",
    options = opts,
    description = "Restart the LSP.",
  },
  -- Telescope.
  {
    mode = { "n" },
    lhs = "<leader><leader>",
    rhs = function()
      require("telescope.builtin").builtin()
    end,
    options = opts,
    description = "Broswe trough all Telescope builtins.",
  },
  {
    mode = { "n" },
    lhs = "<leader>fk",
    rhs = function()
      require("telescope.builtin").keymaps()
    end,
    options = opts,
    description = "Broswe trough all the registered mappings.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ff",
    rhs = function()
      require("utils.api").telescope_git_or_file()
    end,
    options = opts,
    description = "Find files in the current workspace.",
  },
  {
    mode = { "n" },
    lhs = "<leader>fr",
    rhs = function()
      require("telescope.builtin").oldfiles()
    end,
    options = opts,
    description = "Find files in the current workspace.",
  },
  {
    mode = { "n" },
    lhs = "<leader>lg",
    rhs = function()
      require("telescope.builtin").live_grep()
    end,
    options = opts,
    description = "Find a string in the current workspace.",
  },
  {
    mode = { "n" },
    lhs = "<leader>zl",
    rhs = function()
      require("telescope").extensions.zoxide.list()
    end,
    options = opts,
    description = "Jump to directories using zoxide.",
  },
  {
    mode = { "n" },
    lhs = "<leader><Tab>",
    rhs = function()
      require("telescope.builtin").buffers()
    end,
    options = opts,
    description = "Browse trough the open buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>;",
    rhs = function()
      require("telescope.builtin").resume()
    end,
    options = opts,
    description = "Resume to last open picker.",
  },
  {
    mode = { "n" },
    lhs = "<leader>/",
    rhs = function()
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        previewer = false,
      }))
    end,
    options = opts,
    description = "Fuzzily search in current buffer.",
  },
  -- Refactoring.
  {
    mode = { "n", "v" },
    lhs = "<leader>rr",
    rhs = [[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]],
    options = opts,
    description = "Refactor.",
  },
  -- Git Worktree.
  {
    mode = { "n" },
    lhs = "<leader>wl",
    rhs = ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
    options = opts,
    description = "Browse trough the git worktrees.",
  },
  {
    mode = { "n" },
    lhs = "<leader>wa",
    rhs = ":lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
    options = opts,
    description = "Create a new git worktree.",
  },
  -- TODO.
  {
    mode = { "n" },
    lhs = "<leader>tt",
    rhs = ":TodoTelescope<CR>",
    options = opts,
    description = "TODOs in current buffer",
  },
  {
    mode = { "n" },
    lhs = "<leader>ta",
    rhs = ":TodoTelescope keywords=TODO,FIX,FIXME<CR>",
    options = opts,
    description = "TODOs/FIXs/FIXMEs in current buffer",
  },
  -- Git.
  {
    mode = { "n" },
    lhs = "<leader>tb",
    rhs = ":Gitsigns toggle_current_line_blame<CR>",
    options = opts,
    description = "Toggle current line blame.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ph",
    rhs = ":lua require('gitsigns').preview_hunk()<CR>",
    options = opts,
    description = "Preview current hunk.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bf",
    rhs = ":lua require('gitsigns').blame_line{full=true}<CR>",
    options = opts,
    description = "Show current block blame.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dt",
    rhs = ":Gitsigns diffthis<CR>",
    options = opts,
    description = "Open diff view.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dT",
    rhs = ":Gitsigns toggle_deleted<CR>",
    options = opts,
    description = "Show deleted lines.",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>rh",
    rhs = ":Gitsigns reset_hunk<CR>",
    options = opts,
    description = "Reset current hunk.",
  },
  {
    mode = { "n" },
    lhs = "<leader>rb",
    rhs = ":Gitsigns reset_buffer<CR>",
    options = opts,
    description = "Reset current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<leader>sh",
    rhs = ":Gitsigns stage_hunk<CR>",
    options = opts,
    description = "Stage current hunk.",
  },
  {
    mode = { "n" },
    lhs = "<leader>uh",
    rhs = ":Gitsigns undo_stage_hunk<CR>",
    options = opts,
    description = "Unstage current hunk.",
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
    options = opts,
    description = "Jump to the prev hunk.",
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
    options = opts,
    description = "Jump to the next hunk.",
  },
  -- Buffers.
  {
    mode = { "n" },
    lhs = "<leader>bd",
    rhs = ":BufferDelete<CR>",
    options = opts,
    description = "Delete the current Buffer while maintaining the window layout.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bq",
    rhs = ":BufferLinePickClose<CR>",
    options = opts,
    description = "Close target buffer.",
  },
  {
    mode = { "n" },
    lhs = "<Tab>",
    rhs = ":BufferLineCycleNext<CR>",
    options = opts,
    description = "Cycle to next buffer.",
  },
  {
    mode = { "n" },
    lhs = "<S-Tab>",
    rhs = ":BufferLineCyclePrev<CR>",
    options = opts,
    description = "Cycle to previous buffer.",
  },
  {
    mode = { "n" },
    lhs = "<C-h>",
    rhs = ":BufferLineMovePrev<CR>",
    options = opts,
    description = "Move current buffer to left.",
  },
  {
    mode = { "n" },
    lhs = "<C-l>",
    rhs = ":BufferLineMoveNext<CR>",
    options = opts,
    description = "Move current buffer to right.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bh",
    rhs = ":BufferLineCloseLeft<CR>",
    options = opts,
    description = "Close all left buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bl",
    rhs = ":BufferLineCloseRight<CR>",
    options = opts,
    description = "Close all right buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bo",
    rhs = function()
      vim.cmd("BufferLineCloseLeft")
      vim.cmd("BufferLineCloseRight")
    end,
    options = opts,
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
    options = opts,
    description = "Close all buffers.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bt",
    rhs = ":BufferLinePick<CR>",
    options = opts,
    description = "Go to buffer *.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bs",
    rhs = ":BufferLineSortByExtension<CR>",
    options = opts,
    description = "Buffers sort (by extension).",
  },
})

return M
