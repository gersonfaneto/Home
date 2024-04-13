if not vim.filetype then
  return
end

vim.filetype.add({
  filename = {
    [".clangd"] = "yaml",
    [".clang-format"] = "yaml",
    [".gitignore"] = "gitconfig",
    ["go.sum"] = "gosum",
    ["go.mod"] = "gomod",
    ["LICENSE"] = "license",
  },
  pattern = {
    ["^.env%..*"] = "bash",
  },
})
