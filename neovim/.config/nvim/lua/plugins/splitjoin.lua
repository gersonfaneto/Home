return {
  "bennypowers/splitjoin.nvim",
  keys = {
    {
      "<leader>J",
      function()
        require("splitjoin").join()
      end,
      desc = "Join the object under cursor",
    },
    {
      "<leader>S",
      function()
        require("splitjoin").split()
      end,
      desc = "Split the object under cursor",
    },
  },
}
