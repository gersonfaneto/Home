return {
  "kndndrj/nvim-dbee",
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
    local base = require("utils.base")

    local dbee = require("dbee")

    dbee.setup()

    base.mappings.bulk_register({
      {
        mode = { "n" },
        lhs = "<leader>dbo",
        rhs = dbee.open,
        options = { noremap = true, silent = true },
        description = "DB - Open UI.",
      },
      {
        mode = { "n" },
        lhs = "<leader>dbc",
        rhs = dbee.close,
        options = { noremap = true, silent = true },
        description = "DB - Close UI.",
      },
      {
        mode = { "n" },
        lhs = "<leader>dbt",
        rhs = dbee.toggle,
        options = { noremap = true, silent = true },
        description = "DB - Toggle UI.",
      },
      {
        mode = { "n" },
        lhs = "<leader>dbn",
        rhs = dbee.next,
        options = { noremap = true, silent = true },
        description = "DB - Go to next result page.",
      },
      {
        mode = { "n" },
        lhs = "<leader>dbp",
        rhs = dbee.prev,
        options = { noremap = true, silent = true },
        description = "DB - Go to previous result page.",
      },
    })
  end,
}
