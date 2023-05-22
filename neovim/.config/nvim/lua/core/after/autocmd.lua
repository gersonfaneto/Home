local api = require("utils.api")
local settings = require("core.settings")

local favoriteLangs = {
  cpp = { build = "g++ % -o %:r", exec = "./%:r" },
  cs = { build = "dotnet build", exec = "dotnet run" },
  c = { build = "gcc % -o %:r", exec = "./%:r" },
  java = { build = "javac %", exec = "java %:r" },
  python = { exec = "python %" },
  typescript = { build = "tsc %", exec = "node %:r.js" },
  javascript = { exec = "node %" },
  sh = { build = "chmod u+x %", exec = "./%" },
}

local M = {}

for langType, langInfo in pairs(favoriteLangs) do
  if langInfo.build ~= nil then
    vim.api.nvim_create_autocmd("FileType", {
      command = "nnoremap <F5> :!" .. langInfo.build .. "<CR>",
      pattern = langType,
    })
  end
  vim.api.nvim_create_autocmd("FileType", {
    command = "nnoremap <F6> :split<CR>:terminal " .. langInfo.exec .. "<CR>",
    pattern = langType,
  })
end

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
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300,
    })
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

if settings.remember_position then
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

return M
