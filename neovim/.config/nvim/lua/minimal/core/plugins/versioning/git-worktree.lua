local M = {
  "ThePrimeagen/git-worktree.nvim",
  event = { "VeryLazy" },
}

function M.config()
  local git_worktree = require("git-worktree")

  local telescope = require("telescope")

  git_worktree.setup({
    change_directory_command = "cd",
    update_on_change = true,
    update_on_change_command = "e .",
    clearjumps_on_change = true,
    autopush = false,
  })

  telescope.load_extension("git_worktree")
end

utils.base.mappings.bulk_register({
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
