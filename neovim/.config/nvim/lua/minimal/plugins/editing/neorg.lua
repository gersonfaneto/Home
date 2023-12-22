return {
  "nvim-neorg/neorg",
  cmd = { "Neorg" },
  event = {
    "BufReadPre *.norg",
    "BufNewFile *.norg",
  },
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local neorg = require("neorg")

    neorg.setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.summary"] = {},
        ["core.keybinds"] = {
          config = {
            hook = function(keybinds)
              local leader = keybinds.leader

              keybinds.remap_key("norg", "n", "<C-Space>", "<M-Space>")
              keybinds.remap_key("norg", "n", leader .. "td", "<C-t><C-d>")
              keybinds.remap_key("norg", "n", leader .. "tu", "<C-t><C-u>")
              keybinds.remap_key("norg", "n", leader .. "tp", "<C-t><C-p>")
              keybinds.remap_key("norg", "n", leader .. "th", "<C-t><C-h>")
              keybinds.remap_key("norg", "n", leader .. "ta", "<C-t><C-a>")
              keybinds.remap_key("norg", "n", leader .. "tr", "<C-t><C-r>")
              keybinds.remap_key("norg", "n", leader .. "tc", "<C-t><C-t>")
              keybinds.remap_key("norg", "n", leader .. "ti", "<C-t><C-i>")
            end,
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              Notes = "~/Notes",
              Work = "~/Notes/Work",
              Study = "~/Notes/Study",
              Personal = "~/Notes/Personal",
            },
            default_workspace = "Notes",
            index = "Main.norg",
          },
        },
      },
    })
  end,
}
