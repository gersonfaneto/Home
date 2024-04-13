-- Buffers.
vim.api.nvim_create_user_command("BufferCreate", function()
  vim.ui.input({ prompt = "Name: ", relative = "editor" }, function(name)
    if name == nil then
      return
    end
    vim.api.nvim_command(":e " .. vim.fn.expand("%:p:h") .. "/" .. name)
  end)
end, { desc = "Create a new buffer/file relative to the current buffer." })

vim.api.nvim_create_user_command("BufferDelete", function()
  local file_exists = vim.fn.filereadable(vim.fn.expand("%p"))
  local modified = vim.api.nvim_buf_get_option(0, "modified")

  if file_exists == 0 and modified then
    local user_choice = vim.fn.input("The file is not saved, whether to force delete? [Y/n]: ")
    if user_choice == "y" or user_choice:len() == 0 then
      vim.cmd("bd!")
    end
    return
  end

  local force = not vim.bo.buflisted or vim.bo.buftype == "nofile"

  vim.cmd(force and "bd!" or ("bp | bd! %s"):format(vim.api.nvim_get_current_buf()))
end, { desc = "Delete the current Buffer while maintaining the window layout." })

-- Notes.
vim.api.nvim_create_user_command("NewNote", function()
  vim.ui.input({ prompt = "Name: ", relative = "editor" }, function(name)
    if name == nil then
      return
    end
    vim.api.nvim_command(":e ~/Notes/" .. name .. ".md")
  end)
end, { desc = "Create a new note as a markdown file." })
