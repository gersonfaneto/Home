return {
  "jvgrootveld/telescope-zoxide",
  event = { "VeryLazy" },
  config = function()
    local telescope = require("telescope")

    telescope.load_extension("zoxide")
  end,
}
