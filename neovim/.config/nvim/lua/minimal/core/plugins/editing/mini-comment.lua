return {
  "echasnovski/mini.comment",
  event = { "VeryLazy" },
  config = function()
    local mini_comment = require("mini.comment")

    mini_comment.setup({
      options = {
        custom_commentstring = function()
          return vim.bo.commentstring
        end,
      },
    })
  end,
}
