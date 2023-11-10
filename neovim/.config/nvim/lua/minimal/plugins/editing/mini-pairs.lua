return {
  "echasnovski/mini.pairs",
  event = { "InsertEnter" },
  config = function(_, opts)
    local mini_pairs = require("mini.pairs")

    mini_pairs.setup(opts)
  end,
}
