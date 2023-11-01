return {
  "ThePrimeagen/git-worktree.nvim",
  keys = {
    { "<leader>wl", vim.NIL },
    { "<leader>wa", vim.NIL },
  },
  config = function()
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
  end,
}
