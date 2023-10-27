if not vim.filetype then
  return
end

vim.filetype.add({
  filename = {
    ["dunstrc"] = "cfg",
  },
  pattern = {
    [".*%.conf"] = "conf",
    [".*%.theme"] = "conf",
    ["^.env%..*"] = "bash",
  },
})
