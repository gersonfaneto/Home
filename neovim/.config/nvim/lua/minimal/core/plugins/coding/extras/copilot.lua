local M = {
  "zbirenbaum/copilot.lua",
  event = { "InsertEnter" },
  cond = function()
    return utils.types.settings.enhanced_coding
  end,
}

function M.config()
  local copilot = require("copilot")

  copilot.setup({
    panel = {
      enabled = true,
      auto_refresh = true,
      keymap = {
        jump_next = "<C-j>",
        jump_prev = "<C-k>",
        accept = "<C-a>",
        refresh = "r",
        open = "<C-x><C-a>",
      },
      layout = {
        position = "bottom",
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<C-a>",
        accept_word = false,
        accept_line = false,
        next = "<C-j>",
        prev = "<C-k>",
        dismiss = "<C-e>",
      },
    },
  })
end

return M
