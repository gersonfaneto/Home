local types = require("utils.types")

local mappings = {
  base = {
    "alpha",
    "diffview",
    "flutter-tools",
    "git-worktree",
    "gitsigns",
    "harpoon",
    "indent-blankline",
    "lazy",
    "lsp",
    "lspsaga",
    "mason",
    "neo-tree",
    "neorg",
    "none-ls",
    "octo",
    "oil",
    "refactoring",
    "telescope",
    "todo-comments",
    "treesj",
    "trouble",
    "undotree",
    "vim-maximizer",
    "vimtex",
  },
  extras = {
    ["show_bufferline"] = "bufferline",
    ["enhanced_ui"] = "noice",
    ["db_tools"] = "dbee",
    ["https_tools"] = "rest-nvim",
  },
  prefix = "core.after.mappings.",
}

local M = {}

for _, mapping in pairs(mappings.base) do
  local present, _ = pcall(require, mappings.prefix .. mapping)

  if not present then
    return
  end
end

for condition, mapping in pairs(mappings.extras) do
  if types.get_settings(condition) then
    local present, _ = pcall(require, mappings.prefix .. mapping)

    if not present then
      return
    end
  end
end

return M
