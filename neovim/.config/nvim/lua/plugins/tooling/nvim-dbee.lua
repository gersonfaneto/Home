return {
  "kndndrj/nvim-dbee",
  keys = {
    { "<leader>Do", vim.NIL },
    { "<leader>Dc", vim.NIL },
    { "<leader>Dt", vim.NIL },
    { "<leader>Dp", vim.NIL },
    { "<leader>Dn", vim.NIL },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cond = function()
    local types = require("utils.types")

    return types.get_settings("db_tools")
  end,
  build = function()
    local dbee = require("dbee")

    dbee.install()
  end,
  config = function()
    local dbee = require("dbee")

    dbee.setup()
  end,
}
