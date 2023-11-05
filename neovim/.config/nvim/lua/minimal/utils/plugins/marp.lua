local base = require("minimal.utils.base.tables")

local M = {
  job_ID = 0,
}

---Check if current file can use `Marp`.
---@param bufnr? integer
---@return boolean
function M.is_marp(bufnr)
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

---Start or stop the `Marp` server.
function M.start_server()
  if vim.fn.executable("marp") ~= 1 then
    print("Marp: Marp CLI executable not found.")
    return
  end

  if M.job_ID ~= 0 then
    vim.fn.jobstop(M.job_ID)
    return
  end

  local port = os.getenv("PORT")

  if port == nil then
    port = "8008"
    vim.fn.setenv("PORT", port)
  end

  print("Marp: Started server on http://localhost:" .. port .. ".")

  M.job_ID = vim.fn.jobstart({ "marp", "--server", "--preview", "--html", vim.fn.getcwd() }, {
    on_exit = function(_, code)
      M.job_ID = 0
      if code ~= 143 then
        print("marp: exit", code)
      end
    end,
  })
end

---Stop the `Marp` server.
function M.stop_server()
  vim.fn.jobstop(M.job_ID)

  M.job_ID = 0

  print("Marp: Server stopped.")
end

return M
