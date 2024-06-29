local M = {}

---Create a new `augroup` under the **minimal** prefix.
---@param description string @ Brief description for `augroup`.
local function create_minimal_augroup(description)
  return vim.api.nvim_create_augroup("minimal_" .. description, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = create_minimal_augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  group = create_minimal_augroup("improve_colorscheme"),
  callback = function()
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
    vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
    vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = create_minimal_augroup("activate_spell_check"),
  pattern = {
    "*.md",
    "*.txt",
    "*.tex",
    "COMMIT_EDITMSG",
  },
  command = "set spell",
})

vim.api.nvim_create_autocmd("BufNewFile", {
  group = create_minimal_augroup("create_missing_directories"),
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
  group = create_minimal_augroup("smart_close"),
  pattern = {
    "qf",
    "oil",
    "man",
    "help",
    "lspinfo",
    "fugitive",
    "checkhealth",
    "DressingSelect",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false

    utils.base.mappings.register({
      mode = { "n" },
      lhs = "q",
      rhs = ":close<CR>",
      options = { noremap = true, silent = true, buffer = event.buf },
      description = "Buffers & Windows :: Close current buffer/window.",
    })
  end,
})

if utils.types.settings.auto_restore_cursor_position then
  vim.api.nvim_create_autocmd("BufReadPost", {
    group = create_minimal_augroup("restore_cursor_position"),
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0 and mark[1] <= lcount then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end,
  })
end

if utils.types.settings.auto_remove_new_lines_comment then
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = create_minimal_augroup("remove_new_lines_comments"),
    pattern = { "*" },
    callback = function()
      vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end,
  })
end

if utils.types.settings.show_cursor_line then
  local cursor_group = create_minimal_augroup("cursor_line")

  vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
    group = cursor_group,
    pattern = "*",
    callback = function()
      local exclude = { "starter" }

      local excluded = vim.tbl_contains(exclude, vim.bo.filetype)

      if not excluded then
        vim.cmd("set cursorline")
      end
    end,
  })

  vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
    group = cursor_group,
    pattern = "*",
    callback = function()
      local exclude = { "starter" }

      local excluded = vim.tbl_contains(exclude, vim.bo.filetype)

      if not excluded then
        vim.cmd("set nocursorline")
      end
    end,
  })
end

if utils.types.settings.auto_save then
  vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    group = create_minimal_augroup("autosave"),
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

if utils.types.settings.full_immersion then
  vim.api.nvim_create_autocmd("VimEnter", {
    group = create_minimal_augroup("full_immersion"),
    callback = function()
      utils.base.mappings.bulk_register({
        {
          mode = { "n", "i", "x" },
          lhs = "<Up>",
          rhs = "Nop",
          description = "Disable Up Arrow.",
        },
        {
          mode = { "n", "i", "x" },
          lhs = "<Down>",
          rhs = "Nop",
          description = "Disable Down Arrow.",
        },
        {
          mode = { "n", "i", "x" },
          lhs = "<Left>",
          rhs = "Nop",
          description = "Disable Left Arrow.",
        },
        {
          mode = { "n", "i", "x" },
          lhs = "<Right>",
          rhs = "Nop",
          description = "Disable Right Arrow.",
        },
      }, { options = { silent = true, noremap = true }, prefix = "Full Immersion :: " })
    end,
  })
end

return M
