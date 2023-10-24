local base = require("utils.base")

local M = {
  JobID = 0,
}

--- Check if current file can use marp.
--- @param bufnr? integer
--- @return boolean
function M.IsMarp(bufnr)
  bufnr = base.buffers.bufnr(bufnr)

  local line_count = vim.api.nvim_buf_line_count(bufnr)

  if
    line_count < 3
    or not base.files.has_filetype("markdown", vim.bo[bufnr].filetype)
    or vim.trim(vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1]) ~= "---"
  then
    return false
  end

  local sep = vim.regex([[\v^\-{3,}\s*$]])
  local m = vim.regex([[\v^marp:\s*true\s*$]])

  for i = 1, line_count - 1, 1 do
    if m:match_line(bufnr, i) then
      return true
    elseif sep:match_line(bufnr, i) then
      return false
    end
  end

  return false
end

M.StartServer = function()
  if vim.fn.executable("marp") ~= 1 then
    print("Marp: Marp CLI executable not found.")
    return
  end

  if M.JobID ~= 0 then
    vim.fn.jobstop(M.JobID)
    return
  end

  local port = os.getenv("PORT")

  if port == nil then
    port = "8008"
    vim.fn.setenv("PORT", port)
  end

  print("Marp: Started server on http://localhost:" .. port .. ".")

  M.JobID = vim.fn.jobstart({ "marp", "--server", "--preview", "--html", vim.fn.getcwd() }, {
    on_exit = function(_, code)
      M.JobID = 0
      if code ~= 143 then
        print("marp: exit", code)
      end
    end,
  })
end

M.StopServer = function()
  vim.fn.jobstop(M.JobID)

  M.JobID = 0

  print("Marp: Server stopped.")
end

return M
