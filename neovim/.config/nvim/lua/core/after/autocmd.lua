---@diagnostic disable: undefined-global

local types = require("utils.types")
local interface = require("utils.interface")

local colors = interface.get_colors()

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
  pattern = {
    "*.md",
    "*.txt",
    "*.org",
    "*.norg",
    "*.tex",
    "*.bib",
    "COMMIT_EDITMSG",
  },
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.fn.expand("%:t") == "LICENSE" then
      vim.bo.filetype = "license"
    end
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.cmd("highlight NormalFloat guibg=none guifg=none")
    vim.cmd("highlight FloatBorder guifg=" .. colors.fg .. " guibg=none")
    vim.cmd("highlight NormalNC guibg=none guifg=none")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", ":close<CR>", { silent = true, buffer = event.buf })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "qf",
  },
  callback = function(event)
    local base = require("utils.base")

    vim.bo[event.buf].buflisted = false

    base.mappings.register({
      mode = { "n" },
      lhs = "<CR>",
      rhs = "<CR>",
      options = { silent = true, noremap = true, buffer = event.buf },
      description = "Quick Fix - Select the item under cursor.",
    })
  end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
  callback = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = 0,
      once = true,
      callback = function()
        local path = vim.fn.expand("%:h")
        local p = require("plenary.path"):new(path)
        if not p:exists() then
          p:mkdir({ parents = true })
        end
      end,
      desc = "Create missing parent directories automatically.",
    })
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BufferDeletePost",
  group = vim.api.nvim_create_augroup("AlphaOnEmpty", { clear = true }),
  callback = function(event)
    local fallback_name = vim.api.nvim_buf_get_name(event.buf)
    local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
    local fallback_on_empty = fallback_name == "" and fallback_ft == ""

    if fallback_on_empty then
      vim.api.nvim_command("Alpha")
      vim.api.nvim_command(event.buf .. "bwipeout")
    end
  end,
})

if types.get_settings("show_cursor_line") then
  local cursor_group = vim.api.nvim_create_augroup("CursorLine", { clear = true })

  vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    pattern = "*",
    command = "set cursorline",
    group = cursor_group,
  })

  vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
    pattern = "*",
    command = "set nocursorline",
    group = cursor_group,
  })
end

if types.get_settings("auto_save") then
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

if types.get_settings("auto_restore_cursor_position") then
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

if types.get_settings("auto_remove_new_lines_comment") then
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    callback = function()
      vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end,
  })
end

return M
