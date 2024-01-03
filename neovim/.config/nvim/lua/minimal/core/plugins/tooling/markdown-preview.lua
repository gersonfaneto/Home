return {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  event = {
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
