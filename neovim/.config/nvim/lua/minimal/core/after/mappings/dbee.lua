local base = require("minimal.utils.base")
local plugins = require("minimal.utils.plugins")

local M = {}

base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>Do",
    rhs = ":lua require('dbee').open()<CR>",
    description = "Open UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dc",
    rhs = ":lua require('dbee').close()<CR>",
    description = "Close UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dt",
    rhs = ":lua require('dbee').toggle()<CR>",
    description = "Toggle UI.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dn",
    rhs = ":lua require('dbee').next()<CR>",
    description = "Go to next result page.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Dp",
    rhs = ":lua require('dbee').prev()<CR>",
    description = "Go to previous result page.",
  },
  {
    mode = { "n" },
    lhs = "<leader>De",
    rhs = function()
      plugins.dbee.execute()
    end,
    description = "Quicly execute a query.",
  },
  {
    mode = { "n" },
    lhs = "<leader>Ds",
    rhs = function()
      plugins.dbee.save()
    end,
    description = "Save the query output.",
  },
  {
    mode = { "v" },
    lhs = "<leader>Ds",
    rhs = function()
      plugins.dbee.save(true)
    end,
    description = "Save the query output.",
  },
}, { options = { silent = true, noremap = true }, prefix = "DB: " })

return M
