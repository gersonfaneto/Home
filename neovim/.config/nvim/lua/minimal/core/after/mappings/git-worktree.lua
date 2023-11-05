local base = require("minimal.utils.base")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>wl",
    rhs = ":Telescope git_worktree git_worktrees<CR>",
    description = "Browse trough the git worktrees.",
  },
  {
    mode = { "n" },
    lhs = "<leader>wa",
    rhs = ":Telescope git_worktree create_git_worktree<CR>",
    description = "Create a new git worktree.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Git Worktree: " })

return M
