local M = {}

M.lsp = {
  base = {
    "bashls", -- Bash
    "clangd", -- C/C++
    "cssls", -- CSS
    "emmet_ls", -- HTML
    "gopls", -- Go
    "html", -- HTML
    "jdtls", -- Java
    "jsonls", -- JSON
    "yamlls", -- YAML
    "lua_ls", -- Lua
    "ocamllsp", -- OCaml
    "pyright", -- Python
    "rust_analyzer", -- Rust
    "svelte", -- Svelte
    "tailwindcss", -- TailwindCSS
    "texlab", -- LaTeX
    "tsserver", -- TypeScript / JavaScript
  },
  extras = {
    "dartls", -- Dart
  },
}

M.linters = {
  "eslint_d", -- TypeScript / JavaScript
  "pylint", -- Python
  "shellcheck", -- Bash/Shell
}

M.formatters = {
  "latexindent", -- LaTeX
  "black", -- Python
  "clang-format", -- C/C++
  "google-java-format", -- Java
  "isort", -- Python
  "ocamlformat", -- OCaml
  "prettier", -- *
  "shfmt", -- Bash|Shell
  "stylua", -- Lua
}

return M
