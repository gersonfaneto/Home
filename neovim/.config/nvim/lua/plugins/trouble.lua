return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = { use_diagnostic_signs = true },
  lazy = true,
  config = function()
    require("trouble").setup {

      mode = "workspace_diagnostics",
      position = "bottom",
      height = 15,
      padding = false,
      action_keys = {
        close = "q",
        cancel = "<ESC>",
        refresh = "r",
        jump = { "<CR>", "<TAB>" },
        open_split = { "<C-x>" },
        open_vsplit = { "<C-v>" },
        open_tab = { "<C-t>" },
        jump_close = { "o" },
        toggle_mode = "m",
        toggle_preview = "P",
        hover = "K",
        preview = "p",
        close_folds = { "zM" },
        open_folds = { "zR" },
        toggle_fold = { "za" },
      },
      auto_jump = {},
      use_diagnostic_signs = true,
    }
  end
}
