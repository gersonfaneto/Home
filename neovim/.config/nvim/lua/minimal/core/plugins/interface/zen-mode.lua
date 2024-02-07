local M = {
  "folke/zen-mode.nvim",
  cmd = { "ZenMode" },
  dependencies = {
    "folke/twilight.nvim",
  },
}

function M.config()
  local zen = require("zen-mode")

  zen.setup({
    window = {
      backdrop = 0.95,
      width = 80,
      height = 1,
      options = {
        signcolumn = "yes",
        number = true,
        relativenumber = true,
      },
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = false,
        laststatus = 0,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = true },
    },
  })
end

return M
