return {
  "dnlhc/glance.nvim",
  event = { "LspAttach" },
  config = function()
    local glance = require("glance")

    glance.setup()
  end,
  keys = {
    { "gD", "<CMD>Glance definitions<CR>", desc = "Glance definitions" },
    { "gR", "<CMD>Glance references<CR>", desc = "Glance references" },
    { "gY", "<CMD>Glance type_definitions<CR>", desc = "Glance type_definitions" },
    { "gM", "<CMD>Glance implementations<CR>", desc = "Glance implementations" },
  },
}
