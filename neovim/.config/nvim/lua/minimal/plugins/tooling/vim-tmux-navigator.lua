return {
  "christoomey/vim-tmux-navigator",
  event = "VeryLazy",
  cond = function()
    return os.getenv("TMUX") ~= nil
  end,
  config = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
}
