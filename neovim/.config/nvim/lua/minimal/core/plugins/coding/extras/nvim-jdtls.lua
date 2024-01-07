local M = {
  "mfussenegger/nvim-jdtls",
  event = {
    "BufReadPre *.java",
    "BufNewFile *.java",
  },
}

return M
