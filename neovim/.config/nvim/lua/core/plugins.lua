local lazy = require("utils.plugins.lazy")

local M = {}

M.themes = {
  {
    "projekt0n/github-nvim-theme",
    tag = "v0.0.7",
    lazy = false,
    priority = 1000,
  },
}

lazy.entry(M)

return M

