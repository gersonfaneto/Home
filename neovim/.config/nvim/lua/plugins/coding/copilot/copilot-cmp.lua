return {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  cmd = { "Copilot" },
  config = function()
    require("copilot_cmp").setup()
  end,
}
