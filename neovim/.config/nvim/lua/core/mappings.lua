---@diagnostic disable: undefined-global

local mapppings = require("utils.api").mappings

local M = {}

mapppings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>c",
    rhs = ":e ~/.config/nvim/ <CR>",
    options = { noremap = true, silent = true },
    description = "Open Neovim config.",
  },
  {
    mode = { "n" },
    lhs = "<leader>n",
    rhs = ":ene <BAR> startinsert <CR>",
    options = { noremap = true, silent = true },
    description = "New buffer",
  },
  {
    mode = { "n" },
    lhs = "<leader>e",
    rhs = ":Ex<CR>",
    options = { noremap = true, silent = true },
    description = "File Explorer.",
  },
  {
    mode = { "n" },
    lhs = "<leader><Esc>",
    rhs = ":qa!<cr>",
    options = { noremap = true, silent = true },
    description = "Escape Neovim",
  },
  {
    mode = { "n" },
    lhs = "<Esc>",
    rhs = ":noh<CR>",
    options = { noremap = true, silent = true },
    description = "Clear search highlight.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cs",
    rhs = ":set spell!<CR>",
    options = { noremap = true, silent = true },
    description = "Enable or disable spell checking.",
  },
  {
    mode = { "n" },
    lhs = "<leader>s",
    rhs = "<C-w>j",
    options = { noremap = true, silent = true },
    description = "Move to the split bellow.",
  },
  {
    mode = { "n" },
    lhs = "<leader>a",
    rhs = "<C-w>h",
    options = { noremap = true, silent = true },
    description = "Move to the split on the left.",
  },
  {
    mode = { "n" },
    lhs = "<leader>w",
    rhs = "<C-w>k",
    options = { noremap = true, silent = true },
    description = "Move to the split above.",
  },
  {
    mode = { "n" },
    lhs = "<leader>d",
    rhs = "<C-w>l",
    options = { noremap = true, silent = true },
    description = "Move to the split on the right.",
  },
  {
    mode = { "n" },
    lhs = "<C-Up>",
    rhs = ":resize -2<CR>",
    options = { noremap = true, silent = true },
    description = "Decrease split size horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<C-Down>",
    rhs = ":resize +2<CR>",
    options = { noremap = true, silent = true },
    description = "Increase split size horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<C-Left>",
    rhs = ":vertical resize -2<CR>",
    options = { noremap = true, silent = true },
    description = "Decrease split size vertically.",
  },
  {
    mode = { "n" },
    lhs = "<C-Right>",
    rhs = ":vertical resize +2<CR>",
    options = { noremap = true, silent = true },
    description = "Increase split size vertically.",
  },
  {
    mode = { "n" },
    lhs = "<Tab>",
    rhs = ":bnext<CR>",
    options = { noremap = true, silent = true },
    description = "Switch to next buffer.",
  },
  {
    mode = { "n" },
    lhs = "<S-Tab>",
    rhs = ":bprevious<CR>",
    options = { noremap = true, silent = true },
    description = "Switch to previous buffer.",
  },
  {
    mode = { "n" },
    lhs = "<BS>",
    rhs = ":b#<CR>",
    options = { noremap = true, silent = true },
    description = "Quickly switch between current and last open buffer.",
  },
  {
    mode = { "n" },
    lhs = "<leader>q",
    rhs = ":BufferDelete<CR>",
    options = { noremap = true, silent = true },
    description = "Kill current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<leader>h",
    rhs = ":split<CR>",
    options = { noremap = true, silent = true },
    description = "Split horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<leader>v",
    rhs = ":vsplit<CR>",
    options = { noremap = true, silent = true },
    description = "Split vertically.",
  },
  {
    mode = { "n" },
    lhs = "<C-w>",
    rhs = ":write<CR>",
    options = { noremap = true, silent = true },
    description = "Write contents in the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<C-q>",
    rhs = ":quit<CR>",
    options = { noremap = true, silent = true },
    description = "Close the current buffer.",
  },
  {
    mode = { "v" },
    lhs = "p",
    rhs = '"_dp"',
    options = { noremap = true, silent = true },
    description = "paste in visual mode without writing to registers.",
  },
  {
    mode = { "v" },
    lhs = "P",
    rhs = '"_dP"',
    options = { noremap = true, silent = true },
    description = "Paste in visual mode without writing to registers.",
  },
  {
    mode = { "n" },
    lhs = "YY",
    rhs = "va{Vy",
    options = { noremap = true, silent = true },
    description = "Yank everything between and including { and }.",
  },
  {
    mode = { "n" },
    lhs = "dd",
    rhs = function()
      if vim.api.nvim_get_current_line():match("^%s*$") then
        return '"_dd'
      else
        return "dd"
      end
    end,
    options = { expr = true },
    description = "Delete empty lines without writing to registers.",
  },
  {
    mode = { "n" },
    lhs = "<C-a>",
    rhs = "ggVG",
    options = { noremap = true, silent = true },
    description = "Select all the content from the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<C-y>",
    rhs = ":%y<CR>",
    options = { noremap = true, silent = true },
    description = "Copy all the content from the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "+",
    rhs = "<C-a>",
    options = { noremap = true, silent = true },
    description = "Increment number under the cursor.",
  },
  {
    mode = { "n" },
    lhs = "-",
    rhs = "<C-x>",
    options = { noremap = true, silent = true },
    description = "Decrement number under the cursor.",
  },
  {
    mode = { "n" },
    lhs = "<C-u>",
    rhs = function()
      vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "kzz")
    end,
    options = { noremap = true, silent = true },
    description = "Better navigation with C-u.",
  },
  {
    mode = { "n" },
    lhs = "<C-d>",
    rhs = function()
      vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "jzz")
    end,
    options = { noremap = true, silent = true },
    description = "Better navigation with C-d.",
  },
  {
    mode = { "n", "x" },
    lhs = "k",
    rhs = function()
      return vim.v.count > 0 and "k" or "gk"
    end,
    options = { noremap = true, silent = true, expr = true },
    description = "Better movement with k.",
  },
  {
    mode = { "n", "x" },
    lhs = "j",
    rhs = function()
      return vim.v.count > 0 and "j" or "gj"
    end,
    options = { noremap = true, silent = true, expr = true },
    description = "Better movement with j.",
  },
  {
    mode = { "n", "x" },
    lhs = "H",
    rhs = function()
      return vim.v.count > 0 and "^" or "g^"
    end,
    options = { noremap = true, silent = true, expr = true },
    description = "Move to the first character at the beginning of the line.",
  },
  {
    mode = { "n", "x" },
    lhs = "L",
    rhs = function()
      return vim.v.count > 0 and "$" or "g$"
    end,
    options = { noremap = true, silent = true, expr = true },
    description = "Move to the last character at the end of the line.",
  },
  {
    mode = { "n" },
    lhs = "i",
    rhs = function()
      local cond = #vim.fn.getline(".") == 0
      if cond then
        return '"_cc'
      else
        return "i"
      end
    end,
    options = { noremap = true, silent = true, expr = true },
    description = "Automatically indent to the appropriate position, when entering insert mode.",
  },
  {
    mode = { "v" },
    lhs = ">",
    rhs = ">gv",
    options = { noremap = true, silent = true },
    description = "Better forward indenting.",
  },
  {
    mode = { "v" },
    lhs = "<",
    rhs = "<gv",
    options = { noremap = true, silent = true },
    description = "Better backwards indenting.",
  },
  {
    mode = { "n" },
    lhs = "<CR>",
    rhs = "ciw",
    options = { noremap = true, silent = true },
    description = "Quickly edit word under cursor.",
  },
  {
    mode = { "n" },
    lhs = "<A-Down>",
    rhs = ":m .+1<CR>==",
    options = { noremap = true, silent = true },
    description = "Move current line down.",
  },
  {
    mode = { "n" },
    lhs = "<A-Up>",
    rhs = ":m .-2<CR>==",
    options = { noremap = true, silent = true },
    description = "Move current line up.",
  },
  {
    mode = { "i" },
    lhs = "<A-Down>",
    rhs = "<Esc>:m .+1<CR>==gi",
    options = { noremap = true, silent = true },
    description = "Move current line down.",
  },
  {
    mode = { "i" },
    lhs = "<A-Up>",
    rhs = "<Esc>:m .-2<CR>==gi",
    options = { noremap = true, silent = true },
    description = "Move current line up.",
  },
  {
    mode = { "v" },
    lhs = "<A-Down>",
    rhs = ":m '>+1<CR>gv=gv",
    options = { noremap = true, silent = true },
    description = "Move current line down.",
  },
  {
    mode = { "v" },
    lhs = "<A-Up>",
    rhs = ":m '<-2<CR>gv=gv",
    options = { noremap = true, silent = true },
    description = "Move current line down.",
  },
  {
    mode = { "v" },
    lhs = "y",
    rhs = "ygv<Esc>",
    options = { noremap = true, silent = true },
    description = "Copy without returning to start of selection.",
  },
})

return M
