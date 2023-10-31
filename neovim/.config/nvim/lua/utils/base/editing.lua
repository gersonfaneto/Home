local M = {}

function M.AlignText()
  local c = vim.fn.input("Align with: ")
  local start = vim.fn.col("'<")
  local max = 0
  for i = vim.fn.line("'<"), vim.fn.line("'>") do
    local line = vim.fn.getline(i)
    local equals = string.find(line, c, start)
    if equals then
      local length = equals - start
      if length > max then
        max = length
      end
    end
  end
  for i = vim.fn.line("'<"), vim.fn.line("'>") do
    local line = vim.fn.getline(i)
    local equals = string.find(line, c, start)
    if equals then
      local length = equals - start
      local spaces = max - length
      local spaces_string = string.rep(" ", spaces)
      local new_line = string.sub(line, 0, equals - 1) .. spaces_string .. string.sub(line, equals)
      vim.fn.setline(i, new_line)
    end
  end
end

function M.SurroundWith(t)
  local open_char = vim.fn.input("Surround with: ")
  local closed_char = nil

  if open_char == "(" then
    closed_char = ")"
  end
  if open_char == "[" then
    closed_char = "]"
  end
  if open_char == "{" then
    closed_char = "}"
  end
  if open_char == "<" then
    closed_char = ">"
  end
  if open_char == "'" then
    closed_char = "'"
  end
  if open_char == '"' then
    closed_char = '"'
  end
  if open_char == "`" then
    closed_char = "`"
  end
  if open_char == "/" then
    closed_char = "/"
  end
  if open_char == "|" then
    closed_char = "|"
  end

  if t == "w" then
    vim.cmd("normal! ciw" .. open_char)
  elseif t == "W" then
    vim.cmd("normal! ciW" .. open_char)
  elseif t == "$" then
    vim.cmd("normal! c$" .. open_char)
  end

  vim.cmd("normal! p")
  vim.cmd("normal! a" .. closed_char)
  vim.cmd("normal! a")
end

return M
