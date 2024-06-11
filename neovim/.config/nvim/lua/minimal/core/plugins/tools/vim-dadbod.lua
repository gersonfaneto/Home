local M = {
  "tpope/vim-dadbod",
  cmd = { "DBUIToggle" },
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  opts = {
    completion = function()
      require("cmp").setup.buffer({
        sources = {
          { name = "vim-dadbod-completion" },
        },
      })
    end,
  },
}

function M.init()
  vim.g.db_ui_winwidth = 40
  vim.g.db_ui_win_position = "left"

  vim.g.db_ui_show_help = 0
  vim.g.db_ui_use_nvim_notify = 1

  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_show_database_icon = 1

  vim.g.db_ui_execute_on_save = 0
  vim.g.db_ui_auto_execute_table_helpers = 0

  utils.base.mappings.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>db",
      rhs = ":DBUIToggle<CR>",
      description = "Open Database Explorer",
    },
  }, { options = { silent = true, noremap = true }, prefix = "DB :: " })
end

function M.config(_, opts)
  local completion = require("cmp")

  completion.setup.filetype({ "sql" }, {
    sources = {
      { name = "vim-dadbod-completion" },
      { name = "buffer" },
    },
  })

  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "sql",
      "mysql",
      "plsql",
    },
    callback = function()
      vim.schedule(opts.completion)

      utils.base.mappings.register({
        mode = { "n", "v" },
        lhs = "R",
        rhs = "<Plug>(DBUI_ExecuteQuery)",
        options = { silent = true, noremap = true },
        description = "DB :: Execute Query.",
      })
    end,
  })
end

return M
