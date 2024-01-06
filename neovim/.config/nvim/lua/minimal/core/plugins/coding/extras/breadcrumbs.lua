return {
  "LunarVim/breadcrumbs.nvim",
  event = { "LspAttach" },
  config = function()
    local breadcrumbs = require("breadcrumbs")

    breadcrumbs.setup()
  end,
}
