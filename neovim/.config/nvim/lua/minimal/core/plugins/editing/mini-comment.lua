return {
  "echasnovski/mini.comment",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  config = function()
    local mini_comment = require("mini.comment")

    mini_comment.setup({})
  end,
}
