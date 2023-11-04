---@class Servers
local M = {}

--- List of linters that can be installed through `Mason` and will be configured by `NullLS`.
--- @type string[]
M.linters = {
  "eslint_d",   -- TypeScript / JavaScript
  "pylint",     -- Python
  "shellcheck", -- Bash/Shell
}

--- List of formatters that can be installed through `Mason` and will be configured by `NullLS`.
--- @type string[]
M.formatters = {
  "latexindent",        -- LaTeX
  "black",              -- Python
  "clang-format",       -- C/C++
  "google-java-format", -- Java
  "isort",              -- Python
  "ocamlformat",        -- OCaml
  "prettier",           -- *
  "shfmt",              -- Bash|Shell
  "stylua",             -- Lua
}

--- List of parsers that will be installed by `TreeSitter`.
--- @type string[]
M.parsers = {
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
}

--- List of language servers that can be installed through `Mason` and will be configured by the
--- native `LSP`.
--- @type string[]
M.base_languages = {
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
}

--- List of language servers that can't be installed through `Mason`, but should be configured by
--- the native `LSP`.
--- @type string[]
M.extra_languages = {
  "dartls", -- Dart
}

return require("utils.base.settings").extend_settings(M, "core.custom.servers")
