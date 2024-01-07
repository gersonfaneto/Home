local M = {
  "stevearc/dressing.nvim",
  event = { "VeryLazy" },
}

function M.config()
  local dressing = require("dressing")

  dressing.setup({
    input = {
      relative = "win",
      title_pos = "center",
      default_prompt = "➤ ",
    },
    select = {
      backend = { "builtin" },
      builtin = {
        relative = "win",
      },
    },
  })
end

return M
