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
              keybinds.remap_key("norg", "n", "<C-Space>", "<M-Space>")
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
