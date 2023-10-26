local types = require("utils.types")

local M = {}

require("core.after.mappings.alpha")

if types.get_settings("show_bufferline") then
  require("core.after.mappings.bufferline")
end

require("core.after.mappings.copilot")
require("core.after.mappings.flutter-tools")
require("core.after.mappings.git-worktree")
require("core.after.mappings.gitsigns")
require("core.after.mappings.indent-blankline")
require("core.after.mappings.lazy")
require("core.after.mappings.lsp")
require("core.after.mappings.mason")
require("core.after.mappings.neorg")
require("core.after.mappings.octo")
require("core.after.mappings.refactoring")
require("core.after.mappings.telescope")
require("core.after.mappings.todo-comments")

return M
