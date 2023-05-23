local M = {
  requires = {
    "Comment",
  },
}

function M.before() end

function M.load()
  M.comment.setup({
    opleader = {
      line = "gc",
      block = "gb",
    },
    toggler = {
      line = "gcc",
      block = "gcb",
    },
    extra = {
      above = "gck",
      below = "gcj",
      eol = "gca",
    },
  })
end

function M.after() end

return M
