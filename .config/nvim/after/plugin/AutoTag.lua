local hadSuccess, AutoTag = pcall(require, "nvim-ts-autotag")

if not hadSuccess then
  return
end

AutoTag.setup({})
