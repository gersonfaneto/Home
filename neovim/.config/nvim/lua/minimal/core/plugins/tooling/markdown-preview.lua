return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  event = {
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
