---@diagnostic disable: undefined-global

local settings = require("core.settings")

local M = {}

vim.api.nvim_create_autocmd("InsertEnter", {
  command = "set norelativenumber",
  pattern = "*",
})

vim.api.nvim_create_autocmd("InsertLeave", {
  command = "set relativenumber",
  pattern = "*",
})

vim.api.nvim_create_autocmd("BufEnter", {
  command = "highlight Pmenu guibg=NONE",
  pattern = "*",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  command = "set spell",
  pattern = { "*.md", "*.txt", "COMMIT_EDITMSG" },
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.java" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

if settings.auto_save then
  vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = { "*" },
    callback = function()
      local disable_file_types = {
        "toggleterm",
        "translate",
      }
      local directory = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:h")
      if vim.fn.isdirectory(directory) == 0 and not vim.tbl_contains(disable_file_types, vim.bo.filetype) then
        vim.fn.mkdir(directory, "p")
      end
      vim.cmd("silent! wall")
    end,
    nested = true,
  })
end

if settings.auto_restore_cursor_position then
  vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end,
  })
end

if settings.auto_remove_new_lines_comments then
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = { "*" },
        callback = function()
            vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
        end,
    })
end

return M
