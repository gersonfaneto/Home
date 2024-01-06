local base = require("minimal.utils.base")
local types = require("minimal.utils.types")

local M = {}

vim.api.nvim_create_autocmd("InsertEnter", {
  command = "set norelativenumber",
})

vim.api.nvim_create_autocmd("InsertLeave", {
  command = "set relativenumber",
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
    "COMMIT_EDITMSG",
  },
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf" },
  callback = function()
    if vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0 then
      vim.defer_fn(function()
        vim.cmd("lclose")
        vim.cmd("Trouble loclist")
      end, 0)
    else
      vim.defer_fn(function()
        vim.cmd("cclose")
        vim.cmd("Trouble quickfix")
      end, 0)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "qf",
    "oil",
    "man",
    "help",
    "lspinfo",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false

    base.mappings.register({
      mode = { "n" },
      lhs = "q",
      rhs = ":close<CR>",
      options = { noremap = true, silent = true, buffer = event.buf },
      description = "Close current buffer/window.",
    })
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("custom_terminal", { clear = true }),
  callback = function()
    vim.opt_local.list = false
    vim.opt_local.cursorline = false
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false

    base.mappings.register({
      mode = { "t" },
      lhs = "<ESC>",
      rhs = "<c-\\><c-n>",
      options = { silent = true, noremap = true },
      description = "Exit insert mode.",
    })

    vim.cmd("startinsert")
  end,
})

if types.settings.transparent_floats then
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      vim.cmd("highlight WinSeparator guibg=NONE")
      vim.cmd("highlight Pmenu guibg=NONE")
      vim.cmd("highlight Normal guibg=NONE guifg=NONE")
      vim.cmd("highlight NormalNC guibg=NONE guifg=NONE")
      vim.cmd("highlight NormalFloat guibg=NONE guifg=NONE")
      vim.cmd("highlight FloatBorder guifg=NONE guibg=NONE")
    end,
  })
end

if types.settings.auto_restore_cursor_position then
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

if types.settings.auto_remove_new_lines_comment then
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    callback = function()
      vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end,
  })
end

if types.settings.show_cursor_line then
  local cursor_group = vim.api.nvim_create_augroup("CursorLine", { clear = true })

  vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    pattern = "*",
    group = cursor_group,
    callback = function()
      local exclude = { "starter" }

      local excluded = vim.tbl_contains(exclude, vim.bo.filetype)

      if not excluded then
        vim.cmd("set cursorline")
      end
    end,
  })

  vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
    pattern = "*",
    group = cursor_group,
    callback = function()
      local exclude = { "starter" }

      local excluded = vim.tbl_contains(exclude, vim.bo.filetype)

      if not excluded then
        vim.cmd("set nocursorline")
      end
    end,
  })
end

if types.settings.auto_save then
  vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = { "*" },
    callback = function()
      local excluded = {
        "oil",
        "man",
        "DiffviewFiles",
      }

      local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:h")

      local exclude = vim.tbl_contains(excluded, vim.bo.filetype)
      local is_directory = vim.fn.isdirectory(path) == 0

      if not exclude then
        if is_directory then
          vim.fn.mkdir(path, "p")
        end
        vim.cmd("silent! wall")
      end
    end,
    nested = true,
  })
end

return M
