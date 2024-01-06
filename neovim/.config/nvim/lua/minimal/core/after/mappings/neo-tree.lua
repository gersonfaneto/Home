local M = {}

utils.base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<C-f><C-t>",
    rhs = ":Neotree toggle float<CR>",
    description = "Toggle NeoTree.",
  },
}, { options = { silent = true, noremap = true }, prefix = "NeoTree: " })

return M
