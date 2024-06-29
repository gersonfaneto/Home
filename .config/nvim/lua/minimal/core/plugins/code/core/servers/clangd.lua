local M = {}

local root_files = {
  ".git",
  ".clangd",
  ".clang-tidy",
  ".clang-format",
  "compile_commands.json",
  "compile_flags.txt",
}

M = {
  single_file_support = true,
  cmd = {
    "clangd",
  },
  filetypes = {
    "c",
    "cpp",
    "objc",
    "objcpp",
    "cuda",
    "proto",
  },
  ---@diagnostic disable-next-line: deprecated
  root_dir = require("lspconfig/util").root_pattern(unpack(root_files)),
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = "utf-8",
  },
}

utils.base.mappings.register({
  mode = { "n" },
  lhs = "<leader>ls",
  rhs = ":ClangdSwitchSourceHeader<CR>",
  options = { silent = true, noremap = true },
  description = "C :: Switch between header and souce files.",
})

return M
