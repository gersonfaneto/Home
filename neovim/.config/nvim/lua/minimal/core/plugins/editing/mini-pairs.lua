return {
  "echasnovski/mini.pairs",
  event = { "VeryLazy" },
  config = function(_, opts)
    local mini_pairs = require("mini.pairs")

    mini_pairs.setup(opts)
  end,
}
