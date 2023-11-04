-- HACK: LSP goes crazy without this, can't tell why... - 11.04.2023: 
---@diagnostic disable: duplicate-doc-field

---@class Servers
---@field general? General
---@field parsers? Parsers
---@field languages? Languages
local M = {}

---@class General
---@field linters? string[]
---@field formatters? string[]
M.general = {
  linters = {
    "eslint_d",   -- TypeScript / JavaScript
    "pylint",     -- Python
    "shellcheck", -- Bash/Shell
  },
  formatters = {
    "latexindent",        -- LaTeX
    "black",              -- Python
    "clang-format",       -- C/C++
    "google-java-format", -- Java
    "isort",              -- Python
    "ocamlformat",        -- OCaml
    "prettier",           -- *
    "shfmt",              -- Bash|Shell
    "stylua",             -- Lua
  },
}

---@class Parsers
---@field languages? string[]
M.parsers = {
  languages = {
    "bash",
    "c",
    "cpp",
    "css",
    "dart",
    "fish",
    "gitcommit",
    "gitignore",
    "git_rebase",
    "go",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "ocaml",
    "python",
    "rust",
    "sql",
    "toml",
    "typescript",
  },
}

---@class Languages
---@field base? string[]
---@field extras? string[]
M.languages = {
  base = {
    "bashls",        -- Bash
    "clangd",        -- C/C++
    "cssls",         -- CSS
    "emmet_ls",      -- HTML
    "gopls",         -- Go
    "html",          -- HTML
    "jdtls",         -- Java
    "jsonls",        -- JSON
    "yamlls",        -- YAML
    "lua_ls",        -- Lua
    "ocamllsp",      -- OCaml
    "pyright",       -- Python
    "rust_analyzer", -- Rust
    "svelte",        -- Svelte
    "tailwindcss",   -- TailwindCSS
    "texlab",        -- LaTeX
    "tsserver",      -- TypeScript / JavaScript
  },
  extras = {
    "dartls", -- Dart
  },
}

return require("utils.base.settings").extend_settings(M, "core.custom.servers")
