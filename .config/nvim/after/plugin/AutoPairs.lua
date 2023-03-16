local pCall = require("Utils.ProtectedCall")

local AutoPairs = pCall("nvim-autopairs")

AutoPairs.setup({
  disable_filetype = {
    "TelescopePrompt",
    "vim",
  },
})
