local M = {
  "ThePrimeagen/harpoon",
  event = { "VeryLazy" },
  branch = "harpoon2",
}

function M.config()
  local harpoon = require("harpoon")

  local function sync(evt, list)
    local file = evt.file

    local thing = vim.api.nvim_win_get_cursor(0)
    local r, c = thing[1], thing[2]

    for _, item in pairs(list.items) do
      local relative = vim.loop.cwd() .. "/" .. item.value
      if relative == file then
        item.context = {
          col = c,
          row = r,
        }
      end
    end
  end

  harpoon:setup({
    default = {
      save_on_toggle = true,
      sync_on_ui_close = true,
      BufLeave = sync,
      VimLeavePre = sync,
    },
  })
end

M.helpers = {
  open_menu = function()
    local harpoon = require("harpoon")

    harpoon.ui:toggle_quick_menu(harpoon:list())
  end,
  mark_file = function()
    local harpoon = require("harpoon")

    harpoon:list():append()

    vim.notify("󰛢 Harpooned!")
  end,
  select_file = function(index)
    local harpoon = require("harpoon")

    harpoon:list():select(index)
  end,
}

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>mf",
    rhs = M.helpers.mark_file,
    description = "Add current file to Harpoon.",
  },
  {
    mode = { "n" },
    lhs = "<leader>mm",
    rhs = M.helpers.open_menu,
    description = "Browser Harpoon.",
  },
}, { options = { silent = true, noremap = true }, prefix = "Harpoon :: " })

for i = 1, 10 do
  utils.base.mappings.register({
    mode = { "n" },
    lhs = "<leader>" .. i % 10,
    rhs = function()
      M.helpers.select_file(i)
    end,
    options = { silent = true, noremap = true },
    description = "Harpoon :: Select " .. i .. "th File.",
  })
end

return M
