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
      ["core.summary"] = {},
      ["core.keybinds"] = {
        config = {
          hook = function(keybinds)
            local leader = keybinds.leader

            keybinds.remap_key("norg", "n", "<C-Space>", "<M-Space>")
            keybinds.remap_key("norg", "n", leader .. "td", "<C-l><C-d>")
            keybinds.remap_key("norg", "n", leader .. "tu", "<C-l><C-u>")
            keybinds.remap_key("norg", "n", leader .. "tp", "<C-l><C-p>")
            keybinds.remap_key("norg", "n", leader .. "th", "<C-l><C-h>")
            keybinds.remap_key("norg", "n", leader .. "ta", "<C-l><C-a>")
            keybinds.remap_key("norg", "n", leader .. "tr", "<C-l><C-r>")
            keybinds.remap_key("norg", "n", leader .. "tc", "<C-l><C-t>")
            keybinds.remap_key("norg", "n", leader .. "ti", "<C-l><C-i>")
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
end

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>ni",
    rhs = ":Neorg index<CR>",
    description = "Open current workspace index.",
  },
  {
    mode = { "n" },
    lhs = "<leader>nr",
    rhs = ":Neorg return<CR>",
    description = "Return to the previous point.",
  },
}, { options = { noremap = true, silent = true }, prefix = "Neorg: " })

return M
