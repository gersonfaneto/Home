return {
  "jvgrootveld/telescope-zoxide",
  keys = {
    { "<leader>zl", vim.NIL },
  },
  config = function()
    local telescope = require("telescope")

    telescope.load_extension("zoxide")
  end,
}
