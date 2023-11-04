local M = {}

---Check if `filetype` has `dst`.
---@param dst string Destination file type.
---@param filetype? string File type to be checked, default *filetype* of current buffer.
---@return boolean result True if `filetype` has `dst`.
function M.has_filetype(dst, filetype)
  filetype = filetype or vim.bo.filetype

  if not filetype then
    return false
  end

  return vim.tbl_contains(vim.split(filetype, "%."), dst)
end

return M
