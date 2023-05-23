local M = {
  requires = {
    "nvim-autopairs",
  },
}

function M.before() end

function M.load()
  M.nvim_autopairs.setup({
    map_c_h = true,
    map_c_w = true,
    disable_filetype = {
      "TelescopePrompt",
      "vim",
    },
  })
end

function M.after() end

return M
