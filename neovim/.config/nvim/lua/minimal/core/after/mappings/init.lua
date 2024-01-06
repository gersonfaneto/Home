local mappings = {
  base = {
    "ccc",
    "crates",
    "diffview",
    "git-worktree",
    "gitsigns",
    "glance",
    "harpoon",
    "lazy",
    "lsp",
    "mason",
    "mini-starter",
    "neo-tree",
    "neorg",
    "noice",
    "none-ls",
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
  extras = {},
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
  if utils.types.settings[condition] then
    local present, _ = pcall(require, mappings.prefix .. mapping)

    if not present then
      print("Error loading " .. mapping .. " mappings")
      return
    end
  end
end

return M
