return {
  "kndndrj/nvim-dbee",
  event = { "VeryLazy" },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cond = function()
    local types = require("utils.types")

    return types.get_settings("db_tools")
  end,
  build = function()
    local dbee = require("dbee")

    dbee.install("go")
  end,
  config = function()
    local dbee = require("dbee")

    dbee.setup()
  end,
}
