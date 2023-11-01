if not vim.filetype then
  return
end

vim.filetype.add({
  filename = {
    ["LICENSE"] = "license",
  },
  pattern = {
    [".*%.conf"] = "conf",
    [".*%.theme"] = "conf",
    ["^.env%..*"] = "bash",
  },
})
