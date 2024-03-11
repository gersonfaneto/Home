local M = {
  ["laytan/cloak.nvim"] = {
    "laytan/cloak.nvim",
    cmd = {
      "CloakEnable",
      "CloakDisable",
      "CloakToggle",
    },
    event = {
      "BufReadPre *.env",
      "BufNewFile *.env",
    },
  },
  helpers = {},
}

M["laytan/cloak.nvim"].init = function()
  M.helpers.register_mappings()
end

M["laytan/cloak.nvim"].config = function()
  local cloak = require("cloak")

  cloak.setup()
end

M.helpers = {
  register_mappings = function()
    utils.base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<C-c><C-e>",
        rhs = function()
          vim.cmd("CloakEnable")
          vim.notify("Enabled.", vim.log.levels.WARN, { title = "Cloak ::" })
        end,
        description = "Enable.",
      },
      {
        mode = { "n" },
        lhs = "<C-c><C-d>",
        rhs = function()
          vim.cmd("CloakDisable")
          vim.notify("Disabled.", vim.log.levels.WARN, { title = "Cloak ::" })
        end,
        description = "Disable.",
      },
    }, { options = { silent = true, noremap = true }, prefix = "Cloak :: " })
  end,
}

return M["laytan/cloak.nvim"]
