local M = {
  "ThePrimeagen/harpoon",
  event = { "VeryLazy" },
  branch = "harpoon2",
}

function M.config()
  local harpoon = require("harpoon")

  harpoon:setup()

  utils.base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>mf",
      rhs = function()
        harpoon:list():add()
        vim.notify("󰛢 Harpooned!", "info", { title = "Harpoon" })
      end,
      description = "Add current file to Harpoon.",
    },
    {
      mode = { "n" },
      lhs = "<leader>mm",
      rhs = function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      description = "Browser Harpoon.",
    },
  }, { options = { silent = true, noremap = true }, prefix = "Harpoon :: " })

  for _, i in pairs({1, 2, 3, 4, 5}) do
    utils.base.mappings.register({
      mode = { "n" },
      lhs = string.format("<leader>%d", i),
      rhs = function()
        harpoon:list():select(i)
      end,
      options = { silent = true, noremap = true },
      description = string.format("Harpoon :: Navigato to %dth File.", i),
    })
  end
end

return M
