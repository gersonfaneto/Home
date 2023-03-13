local hadSuccess, Signature = pcall(require, "lsp_signature")

if not hadSuccess then
  return
end

local Config = {
  debug = false,
  log_path = "debug_log_file_path",
  verbose = false,
  bind = true,
  doc_lines = 0,
  floating_window = true,
  floating_window_above_cur_line = false,
  fix_pos = false,
  hint_enable = false,
  hint_prefix = "",
  hint_scheme = "Comment",
  use_lspsaga = false,
  hi_parameter = "LspSignatureActiveParameter",
  max_height = 12,
  max_width = 120,
  handler_opts = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
  always_trigger = false,
  auto_close_after = nil,
  extra_trigger_chars = {},
  zindex = 200,
  padding = "",
  transparency = 0,
  shadow_blend = 36,
  shadow_guibg = "Black",
  timer_interval = 200,
  toggle_key = "<C-s>",
}

Signature.setup(Config)
