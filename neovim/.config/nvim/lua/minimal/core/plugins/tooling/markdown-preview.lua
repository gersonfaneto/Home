local M = {
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  event = {
    "BufReadPre *.md",
    "BufNewFile *.md",
  },
}

function M.config()
  vim.g.mkdp_filetypes = { "markdown" }
end

return M
