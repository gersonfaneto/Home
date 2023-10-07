return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
      local api = require("utils.api")

      vim.g.mkdp_filetypes = { "markdown" }

      api.mappings.register({
        mode = { "n" },
        lhs = "<leader>mp",
        rhs = ":MarkdownPreviewToggle<CR>",
        options = { noremap = true, silent = true },
        description = "Toggle markdown preview.",
      })
    end,
  },
}
