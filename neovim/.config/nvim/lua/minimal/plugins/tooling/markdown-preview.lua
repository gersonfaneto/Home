return {
  {
    "iamcco/markdown-preview.nvim",
    event = {
      "BufReadPre *.md",
      "BufNewFile *.md",
    },
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
