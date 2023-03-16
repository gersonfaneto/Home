local hadSuccess, AutoPairs = pcall(require, "nvim-autopairs")

if not hadSuccess then
  return
end

AutoPairs.setup({
  disable_filetype = {
    "TelescopePrompt",
    "vim",
  },
})
