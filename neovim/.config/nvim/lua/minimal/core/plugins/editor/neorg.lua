local M = {
  "nvim-neorg/neorg",
  ft = { "norg" },
  cmd = { "Neorg" },
  -- build = ":Neorg sync-parsers",
  dependencies = {
    "luarocks.nvim",
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local neorg = require("neorg")

  neorg.setup({
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.keybinds"] = {
        config = {
          hook = function(keybinds)
            keybinds.remap_key("norg", "n", "<C-Space>", "<M-Space>")
          end,
        },
      },
    },
  })
end

return M
