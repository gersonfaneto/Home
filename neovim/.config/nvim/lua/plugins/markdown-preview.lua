return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
      local base = require("utils.base")

      vim.g.mkdp_filetypes = { "markdown" }

      base.mappings.register({
        mode = { "n" },
        lhs = "<leader>mp",
        rhs = ":MarkdownPreviewToggle<CR>",
        options = { noremap = true, silent = true },
        description = "Toggle markdown preview.",
      })
    end,
  },
}
