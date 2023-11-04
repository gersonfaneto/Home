---@class Parsers
---@field languages string[]

---@class General
---@field linters string[]
---@field formatters string[]

---@class Languages
---@field base string[]
---@field extras string[]

---@class Servers
---@field parsers Parsers
---@field general General
---@field languages Languages
local M = {}

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

return M
