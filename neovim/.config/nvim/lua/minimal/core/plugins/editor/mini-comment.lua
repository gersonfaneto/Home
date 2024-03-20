local M = {
  "echasnovski/mini.comment",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
}

function M.config()
  local mini_comment = require("mini.comment")

  mini_comment.setup({
    options = {
      custom_commentstring = function()
        return vim.bo.commentstring
      end,
    },
  })
end

return M
