local M = {}

--- Returns the real buffer handle, current handle on `nil` input.
--- @param bufnr? integer
--- @return integer
function M.bufnr(bufnr)
  if bufnr == 0 or not bufnr then
    return vim.api.nvim_get_current_buf()
  end

  return bufnr
end

--- Get the directory of the buffer with bufnr.
--- @param bufnr? integer Buffer number, default 0 (current buffer).
--- @return string buf_dir Buffer directory.
function M.get_buf_dir(bufnr)
  bufnr = bufnr or 0

  return vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
end

return M
