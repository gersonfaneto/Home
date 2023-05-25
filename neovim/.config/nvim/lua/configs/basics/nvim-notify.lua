local api = require("utils.api")
local interface = require("utils.interface")
local settiings = require("core.settings")
local icons = interface.get_icons_group("diagnostic", true)

local M = {
  requires = {
    "notify",
  },
  special_message = {
    -- navic
    { 'nvim%-navic: Server ".*" does not support documentSymbols.', echo = false },
  },
}

function M.before()
  M.register_key()
end

function M.load()
  M.notify.setup({
    stages = "fade",
    timeout = 3000,
    fps = 120,
    icons = {
      ERROR = icons.Error,
      WARN = icons.Warn,
      INFO = icons.Hint,
    },
    background_colour = settiings.transparent and "#000000" or "Normal",
  })
end

function M.after()
  vim.notify = setmetatable({}, {
    ---@diagnostic disable-next-line: unused-local
    __call = function(self, message, ...)
      for _, row in ipairs(M.special_message) do
        if message:match(row[1]) then
          if row.echo then
            vim.api.nvim_echo({ { message, "MoreMsg" } }, false, {})
          end
          return
        end
      end
      return M.notify(message, ...)
    end,
    __index = M.notify,
  })
end

function M.register_key()
  api.maps.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>fn",
      rhs = ":Notifications<CR>",
      options = { silent = true },
      description = "Search trough notifications history.",
    },
  })
end

return M
