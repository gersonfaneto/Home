---@diagnostic disable: unused-local, undefined-global

local api = require("utils.api")
local settings = require("core.settings")

local M = {
  requires = {
    "null-ls",
  },
  formatting_filetype_extends = {
    shfmt = { "zsh" },
    fixjson = { "json5" },
  },
}

function M.before() end

function M.load()
  for package_name, filetype_tables in pairs(M.formatting_filetype_extends) do
    vim.tbl_map(function(filetype)
      table.insert(M.null_ls.builtins.formatting[package_name].filetypes, filetype)
    end, filetype_tables)
  end

  M.null_ls.setup({
    border = settings.float_border and "double" or "none",
    sources = {
      M.null_ls.builtins.formatting.shfmt,
      M.null_ls.builtins.formatting.stylua,
      M.null_ls.builtins.formatting.fixjson,
      M.null_ls.builtins.formatting.prettier,
      M.null_ls.builtins.formatting.autopep8,
      M.null_ls.builtins.formatting.clang_format.with({
        filetypes = { "c", "cpp" },
      }),
      M.null_ls.builtins.formatting.google_java_format,
    },
  })
end

function M.after() end

return M
