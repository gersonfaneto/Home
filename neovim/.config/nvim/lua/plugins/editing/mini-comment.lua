return {
  {
    "echasnovski/mini.comment",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local mini_comment = require("mini.comment")

      mini_comment.setup({
        mappings = {
          comment = "<C-_>",
          comment_line = "<C-_>",
          textobject = "<C-_>",
        },
      })
    end,
  },
}
