local M = {
  "nvim-neorg/neorg",
  cmd = { "Neorg" },
  event = {
    "BufReadPre *.norg",
    "BufNewFile *.norg",
  },
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
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
