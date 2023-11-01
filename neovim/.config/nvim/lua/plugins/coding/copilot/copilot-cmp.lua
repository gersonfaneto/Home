return {
  "zbirenbaum/copilot-cmp",
  cmd = { "Copilot" },
  after = { "copilot.lua" },
  cond = function ()
    local types = require("utils.types")

    return types.get_settings("enhanced_coding")
  end,
  config = function()
    local copilot_cmp = require("copilot_cmp")

    copilot_cmp.setup()
  end,
}
