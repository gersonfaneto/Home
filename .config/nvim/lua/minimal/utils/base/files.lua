local M = {}

---Check if `filetype` has `dst`.
---@param dst string Destination file type.
---@param filetype? string File type to be checked, default *filetype* of current buffer.
---@return boolean result `true` if `filetype` has `dst`.
function M.has_filetype(dst, filetype)
  filetype = filetype or vim.bo.filetype

  if not filetype then
    return false
  end

  return vim.tbl_contains(vim.split(filetype, "%."), dst)
end
--
---Checks whether a given path exists and is a file.
---@param path string Path to check.
---@return boolean
function M.is_file(path)
  local stat = vim.loop.fs_stat(path)

  return stat and stat.type == "file" or false
end

---Checks whether a given path exists and is a directory.
---@param path string Path to check.
---@return boolean
function M.is_directory(path)
  local stat = vim.loop.fs_stat(path)

  return stat and stat.type == "directory" or false
end

return M
