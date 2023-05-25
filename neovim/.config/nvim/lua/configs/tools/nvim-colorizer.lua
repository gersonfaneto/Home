local M = {
  requires = {
    "colorizer",
  },
}

function M.before() end

function M.load()
  M.colorizer.setup({
    user_default_options = {
      css = true,
      mode = "virtualtext",
    },
    filetypes = { "*" },
  })
end

function M.after() end

return M
