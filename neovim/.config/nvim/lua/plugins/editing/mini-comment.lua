return {
  {
    "echasnovski/mini.comment",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
}
