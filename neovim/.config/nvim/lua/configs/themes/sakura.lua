local settings = require("core.settings")

local M = {
  requires = {
    "Sakura",
  },
}

function M.before()
end

function M.load()
  M.sakura.setup({
    variant = vim.o.background == 'dark' and 'moon' or 'dawn',
    transparent = settings.transparent,
  })
end

function M.after()
end

return M
