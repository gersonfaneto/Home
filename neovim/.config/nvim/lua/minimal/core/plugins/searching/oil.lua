return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  -- If started with a directory argument, load Oil immediately.
  -- See: https://github.com/folke/lazy.nvim/issues/533
  init = function()
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("lazy").load({ plugins = { "oil.nvim" } })
      end
    end
    if not require("lazy.core.config").plugins["oil.nvim"]._.loaded then
      vim.api.nvim_create_autocmd("BufNew", {
        callback = function()
          if vim.fn.isdirectory(vim.fn.expand("<afile>")) == 1 then
            require("lazy").load({ plugins = { "oil.nvim" } })
            -- Once oil is loaded, we can delete this `autocmd`.
            return true
          end
        end,
      })
    end
  end,
  config = function()
    local oil = require("oil")

    oil.setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      float = {
        max_height = 20,
        max_width = 60,
      },
      keymaps = {
        ["<C-s>"] = false,
        ["s"] = "actions.select_vsplit",
        ["<C-h>"] = false,
        ["h"] = "actions.select_split",
        ["<C-l>"] = false,
        ["R"] = "actions.refresh",
      },
    })
  end,
}
