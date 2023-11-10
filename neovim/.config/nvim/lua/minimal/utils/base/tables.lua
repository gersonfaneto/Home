local M = {}

---Function to recursively merge `src` into `dst`.
---Unlike `vim.tbl_deep_extend()`, this function extends if the original value is a list.
---@param dst table @ Table which will be modified and appended to.
---@param src table @ Table from which values will be inserted.
---@return table @ The merged table.
function M.merge(dst, src)
  for key, value in pairs(src) do
    if type(dst[key]) == "table" and type(value) == "function" then
      dst[key] = value(dst[key])
    elseif type(dst[key]) == "table" and vim.tbl_islist(dst[key]) then
      vim.list_extend(dst[key], value)
    elseif type(dst[key]) == "table" and type(value) == "table" and not vim.tbl_islist(dst[key]) then
      M.merge(dst[key], value)
    else
      dst[key] = value
    end
  end

  return dst
end

return M
