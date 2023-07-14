return {
  "NvChad/nvim-colorizer.lua",
  event = "BufEnter",
  config = function()
    require("colorizer").setup({
      user_default_options = {
        css = true,
        mode = "background",
      },
      filetypes = { "*" },
    })
  end,
}
