local api = require("utils.api")
local options = require("core.options")

local M = {
  requires = {
    "gitsigns",
  },
}

function M.before() end

function M.load()
  M.gitsigns.setup({
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    on_attach = function(bufnr)
      M.register_key()
    end,
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = "│",
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      chang = {
        hl = "GitSignsChange",
        text = "│",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delet = {
        hl = "GitSignsDelete",
        text = "_",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelet = {
        hl = "GitSignsDelete",
        text = "‾",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = "~",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      untracke = {
        hl = "GitSignsAdd",
        text = "┆",
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
    },
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 100,
      ignore_whitespace = false,
    },
    preview_config = {
      border = options.float_border and "rounded" or "none",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  })
end

function M.after() end

function M.register_key()
  api.maps.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>tb",
      rhs = ":Gitsigns toggle_current_line_blame<CR>",
      options = { noremap = true, silent = true },
      description = "Toggle current line blame.",
    },
    {
      mode = { "n" },
      lhs = "<leader>ph",
      rhs = ":lua require('gitsigns').preview_hunk()<CR>",
      options = { noremap = true, silent = true },
      description = "Preview current hunk.",
    },
    {
      mode = { "n" },
      lhs = "<leader>bf",
      rhs = ":lua require('gitsigns').blame_line{full=true}<CR>",
      options = { noremap = true, silent = true },
      description = "Show current block blame.",
    },
    {
      mode = { "n" },
      lhs = "<leader>dt",
      rhs = ":Gitsigns diffthis<CR>",
      options = { noremap = true, silent = true },
      description = "Open diff view.",
    },
    {
      mode = { "n" },
      lhs = "<leader>dT",
      rhs = ":Gitsigns toggle_deleted<CR>",
      options = { noremap = true, silent = true },
      description = "Show deleted lines.",
    },
    {
      mode = { "n", "v" },
      lhs = "<leader>rh",
      rhs = ":Gitsigns reset_hunk<CR>",
      options = { noremap = true, silent = true },
      description = "Reset current hunk.",
    },
    {
      mode = { "n" },
      lhs = "<leader>rH",
      rhs = ":Gitsigns reset_buffer<CR>",
      options = { noremap = true, silent = true },
      description = "Reset current buffer.",
    },
    {
      mode = { "n" },
      lhs = "[c",
      rhs = function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          M.gitsigns.prev_hunk()
        end)
        return "<Ignore>"
      end,
      options = { noremap = true, silent = true, expr = true },
      description = "Jump to the prev hunk.",
    },
    {
      mode = { "n" },
      lhs = "]c",
      rhs = function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          M.gitsigns.next_hunk()
        end)
        return "<Ignore>"
      end,
      options = { noremap = true, silent = true, expr = true },
      description = "Jump to the next hunk.",
    },
  })
end

return M
