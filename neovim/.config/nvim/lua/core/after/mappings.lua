---@diagnostic disable: undefined-global

local maps = require("utils").maps

local M = {}

maps.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>l",
    rhs = ":Lazy<CR>",
    options = { noremap = true, silent = true },
    description = "Open Lazy.",
  },
  {
    mode = { "n" },
    lhs = "<leader>m",
    rhs = ":Alpha<CR>",
    options = { noremap = true, silent = true },
    description = "Open Alpha.",
  },
  {
    mode = { "n" },
    lhs = "<leader>tt",
    rhs = function()
      require("telescope").extensions["todo-comments"].todo()
    end,
    options = { noremap = true, silent = true },
    description = "Find TODO tags in the current workspace.",
  },
  {
    mode = { "n" },
    lhs = "<leader>tb",
    rhs = ":Gitsigns toggle_current_line_blame<CR>",
    options = { noremap = true, silent = true },
    description = "Toggle current line blame.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ph",
    rhs = ":lua require('gitsigns').preview_hunk()<CR>",
    options = { noremap = true, silent = true },
    description = "Preview current hunk.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bf",
    rhs = ":lua require('gitsigns').blame_line{full=true}<CR>",
    options = { noremap = true, silent = true },
    description = "Show current block blame.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dt",
    rhs = ":Gitsigns diffthis<CR>",
    options = { noremap = true, silent = true },
    description = "Open diff view.",
  },
  {
    mode = { "n" },
    lhs = "<leader>dT",
    rhs = ":Gitsigns toggle_deleted<CR>",
    options = { noremap = true, silent = true },
    description = "Show deleted lines.",
  },
  {
    mode = { "n", "v" },
    lhs = "<leader>rh",
    rhs = ":Gitsigns reset_hunk<CR>",
    options = { noremap = true, silent = true },
    description = "Reset current hunk.",
  },
  {
    mode = { "n" },
    lhs = "<leader>rH",
    rhs = ":Gitsigns reset_buffer<CR>",
    options = { noremap = true, silent = true },
    description = "Reset current buffer.",
  },
  {
    mode = { "n" },
    lhs = "[c",
    rhs = function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        M.gitsigns.prev_hunk()
      end)
      return "<Ignore>"
    end,
    options = { noremap = true, silent = true, expr = true },
    description = "Jump to the prev hunk.",
  },
  {
    mode = { "n" },
    lhs = "]c",
    rhs = function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        M.gitsigns.next_hunk()
      end)
      return "<Ignore>"
    end,
    options = { noremap = true, silent = true, expr = true },
    description = "Jump to the next hunk.",
  },
  {
    mode = { "n" },
    lhs = "<leader>;",
    rhs = function()
      require("telescope.builtin").resume(require("telescope.themes").get_dropdown({}))
    end,
    options = { noremap = true, silent = true },
    description = "Resume search.",
  },
  {
    mode = { "n" },
    lhs = "<leader>/",
    rhs = function()
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end,
    options = { noremap = true, silent = true },
    description = "Fuzzily search in current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<leader><leader>",
    rhs = function()
      require("telescope.builtin").builtin()
    end,
    options = { noremap = true, silent = true },
    description = "Broswe trough all Telescope builtins.",
  },
  {
    mode = { "n" },
    lhs = "<leader>fk",
    rhs = function()
      require("telescope.builtin").keymaps()
    end,
    options = { noremap = true, silent = true },
    description = "Broswe trough all the registered mappings.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ff",
    rhs = function()
      require("utils").telescope_git_or_file()
    end,
    options = { noremap = true, silent = true },
    description = "Find files in the current workspace.",
  },
  {
    mode = { "n" },
    lhs = "<leader>lg",
    rhs = function()
      require("telescope.builtin").live_grep()
    end,
    options = { noremap = true, silent = true },
    description = "Find a string in the current workspace.",
  },
  {
    mode = { "n" },
    lhs = "<leader><Tab>",
    rhs = function()
      require("telescope.builtin").buffers()
    end,
    options = { noremap = true, silent = true },
    description = "Browse trough the open buffers.",
  },
})

return M
