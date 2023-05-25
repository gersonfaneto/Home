local api = require("utils.api")

local M = {
  requires = {
    "todo-comments",
  },
}

local Error_Red = "#EA4A5A"
local Warning_Orange = "#FFEA7F"
local Hint_Blue = "#2188FF"
local Perf_Purple = "#B392F0"
local Note_Green = "#34D058"

function M.before()
  M.register_key()
end

function M.load()
  M.todo_comments.setup({
    signs = true,
    sign_priority = 8,
    keywords = {
      FIX = {
        icon = "",
        color = Error_Red,
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
      },
      TODO = { icon = "", color = Hint_Blue, alt = { "TIP" } },
      HACK = { icon = "", color = Warning_Orange },
      WARN = { icon = "", color = Warning_Orange, alt = { "WARNING", "XXX" } },
      PERF = { icon = "", color = Perf_Purple, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "TEST" } },
      NOTE = { icon = "", color = Note_Green, alt = { "INFO" } },
    },
    highlight = {
      before = "",
      keyword = "wide",
      after = "fg",
      pattern = [[.*<(KEYWORDS)\s*:]],
      comments_only = true,
      max_line_len = 400,
      exclude = { "markdown" },
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[\b(KEYWORDS):]],
    },
  })
end

function M.after() end

function M.register_key()
  api.maps.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>tt",
      rhs = function()
        require("telescope").extensions["todo-comments"].todo()
      end,
      options = { noremap = true, silent = true },
      description = "Find TODO tags in the current workspace.",
    },
  })
end

return M
