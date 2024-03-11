local M = {
  "echasnovski/mini.pairs",
  event = { "InsertEnter" },
  cond = function()
    return utils.types.settings.auto_pairs
  end,
}

function M.config()
  local mini_pairs = require("mini.pairs")

  mini_pairs.setup()
end

return M
