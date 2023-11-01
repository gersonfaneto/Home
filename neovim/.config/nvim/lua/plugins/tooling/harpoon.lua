return {
  "ThePrimeagen/harpoon",
  keys = {
    { "<leader>hf", vim.NIL },
    { "<leader>hm", vim.NIL },
    { "<leader>0", vim.NIL },
    { "<leader>1", vim.NIL },
    { "<leader>2", vim.NIL },
    { "<leader>3", vim.NIL },
    { "<leader>4", vim.NIL },
    { "<leader>5", vim.NIL },
    { "<leader>6", vim.NIL },
    { "<leader>7", vim.NIL },
    { "<leader>8", vim.NIL },
    { "<leader>9", vim.NIL },
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup()
  end,
}
