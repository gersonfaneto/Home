local M = {
  "kkoomen/vim-doge",
  cmd = { "DogeGenerate" },
  event = { "LspAttach" },
  build = function()
    vim.fn["doge#install"]()
  end,
}

return M
