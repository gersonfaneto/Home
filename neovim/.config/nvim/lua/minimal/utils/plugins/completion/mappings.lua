local base = require("minimal.utils.base")

local M = {}

local function toggle_autocompletion(completion)
  local is_active = completion.get_config().completion.autocomplete

  if (not utils.types.settings.auto_completion) or (is_active and #is_active > 0) then
    completion.setup({ completion = { autocomplete = false } })
  else
    completion.setup({ completion = { autocomplete = { completion.TriggerEvent.TextChanged } } })
  end

  if not utils.types.settings.auto_completion then
    vim.notify("Can't toggle auto-completion, option disabled under `Settings`.", "warn", { title = "Minimal" })
  else
    if is_active and #is_active > 0 then
      vim.notify("Completion is now disabled.", "warn", { title = "Minimal" })
    else
      vim.notify("Completion is now enabled.", "info", { title = "Minimal" })
    end
  end
end

function M.register(completion)
  base.mappings.register({
    mode = { "n" },
    lhs = "<leader>lc",
    rhs = function()
      return toggle_autocompletion(completion)
    end,
    options = { noremap = true, silent = true },
    description = "Completion :: Toggle.",
  })

  if not utils.types.settings.auto_completion then
    completion.setup({ completion = { autocomplete = false } })
  end
end

return M
