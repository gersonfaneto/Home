return {
  "bennypowers/splitjoin.nvim",
  keys = {
    {
      "oJ",
      function()
        require("splitjoin").join()
      end,
      desc = "Join the object under cursor",
    },
    {
      "oS",
      function()
        require("splitjoin").split()
      end,
      desc = "Split the object under cursor",
    },
  },
}
