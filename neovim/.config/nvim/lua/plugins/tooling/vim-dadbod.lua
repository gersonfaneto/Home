return {
  "tpope/vim-dadbod",
  event = { "VeryLazy" },
  cond = function()
    local types = require("utils.types")

    return types.get_settings("db_tools")
  end,
  dependencies = {
    {
      "kristijanhusak/vim-dadbod-ui",
      event = { "VeryLazy" },
      cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
      },
    },
    {
      "kristijanhusak/vim-dadbod-completion",
      event = { "VeryLazy" },
      ft = {
        "sql",
        "mysql",
        "plsql",
      },
    },
  },
  config = function()
    local base = require("utils.base")

    local save_location = vim.fn.stdpath("config") .. require("plenary.path").path.sep .. "db_ui"

    vim.g.db_ui_save_location = save_location

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "sql",
      },
      command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "sql",
        "mysql",
        "plsql",
      },
      callback = function()
        vim.schedule(function()
          require("cmp").setup.buffer({
            sources = {
              {
                name = "vim-dadbod-completion",
              },
            },
          })
        end)
      end,
    })

    base.mappings.register({
      mode = { "n" },
      lhs = "<leader>dt",
      rhs = ":DBUIToggle<CR>",
      options = { noremap = true, silent = true },
      description = "DB - Toggle DB interface.",
    })
  end,
}
