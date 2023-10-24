return {
  {
    "iamcco/markdown-preview.nvim",
    event = { "BufReadPre", "BufNewFile" },
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
