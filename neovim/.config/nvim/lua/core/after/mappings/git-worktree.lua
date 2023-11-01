local base = require("utils.base")

local props = {
  options = {
    noremap = true,
    silent = true,
  },
  prefix = "Git Worktree: ",
}

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>wl",
    rhs = ":Telescope git_worktree git_worktrees<CR>",
    options = props.options,
    description = "Browse trough the git worktrees.",
  },
  {
    mode = { "n" },
    lhs = "<leader>wa",
    rhs = ":Telescope git_worktree create_git_worktree<CR>",
    options = props.options,
    description = props.prefix .. "Create a new git worktree.",
  },
})

return M
