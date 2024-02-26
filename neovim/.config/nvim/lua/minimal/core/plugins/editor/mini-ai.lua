local M = {
  "echasnovski/mini.ai",
  version = "*",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    mappings = {
      around_last = "",
      inside_last = "",
    },
  },
}

return M
