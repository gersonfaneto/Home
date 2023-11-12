local types = require("minimal.utils.types")

local mappings = {
  base = {
    "alpha",
    "crates-nvim",
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
    "vim-tmux-navigator",
  },
  extras = {
    ["show_bufferline"] = "bufferline",
    ["enhanced_ui"] = "noice",
    ["db_tools"] = "dbee",
    ["http_tools"] = "rest-nvim",
  },
  prefix = "minimal.core.after.mappings.",
}

local M = {}

for _, mapping in pairs(mappings.base) do
  local present, _ = pcall(require, mappings.prefix .. mapping)

  if not present then
    print("Error loading " .. mapping .. " mappings")
    return
  end
end

for condition, mapping in pairs(mappings.extras) do
  if types.settings[condition] then
    local present, _ = pcall(require, mappings.prefix .. mapping)

    if not present then
      print("Error loading " .. mapping .. " mappings")
      return
    end
  end
end

return M
