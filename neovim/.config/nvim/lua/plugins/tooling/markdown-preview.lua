return {
  {
    "iamcco/markdown-preview.nvim",
    event = {
      "BufReadPre *.md",
      "BufNewFile *.md",
    },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
