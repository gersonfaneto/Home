---@diagnostic disable: undefined-global, undefined-field

local base = require("utils.base")
local types = require("utils.types")

local props = {
  options = {
    silent = true,
    noremap = true,
  },
  prefix = "Core: ",
}

local M = {}

-- INFO: Mappings - Settings...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>ec",
    rhs = ":e init.lua<CR>",
    options = props.options,
    description = props.prefix .. "Open Neovim config.",
  },
  {
    mode = { "n" },
    lhs = "<leader>es",
    rhs = ":e lua/core/custom/settings.lua<CR>",
    options = props.options,
    description = props.prefix .. "Open Neovim config.",
  },
})

-- INFO: Mappings - Interface & Visuals...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>cc",
    rhs = function()
      if vim.opt.colorcolumn:get()[1] ~= nil then
        vim.opt.colorcolumn = nil
      else
        vim.opt.colorcolumn = types.get_settings("color_column")
      end
    end,
    options = props.options,
    description = props.prefix .. "Toggle color column.",
  },
})

-- INFO: Mappings - Custom Commands...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>nn",
    rhs = ":NewNote<CR>",
    options = props.options,
    description = props.prefix .. "Create a new note as a markdown file.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bn",
    rhs = ":BufferCreate<CR>",
    options = props.options,
    description = props.prefix .. "Create a new buffer/file relative to the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bd",
    rhs = ":BufferDelete<CR>",
    options = props.options,
    description = props.prefix .. "Delete the current Buffer while maintaining the window layout.",
  },
})

-- INFO: Mappings - File Management...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>fe",
    rhs = ":Ex<CR>",
    options = props.options,
    description = props.prefix .. "File Explorer.",
  },
})

-- INFO: Mappings - Splits & Windows...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>s",
    rhs = "<C-w>j",
    options = props.options,
    description = props.prefix .. "Move to the split bellow.",
  },
  {
    mode = { "n" },
    lhs = "<leader>a",
    rhs = "<C-w>h",
    options = props.options,
    description = props.prefix .. "Move to the split on the left.",
  },
  {
    mode = { "n" },
    lhs = "<leader>w",
    rhs = "<C-w>k",
    options = props.options,
    description = props.prefix .. "Move to the split above.",
  },
  {
    mode = { "n" },
    lhs = "<leader>d",
    rhs = "<C-w>l",
    options = props.options,
    description = props.prefix .. "Move to the split on the right.",
  },
  {
    mode = { "n" },
    lhs = "<leader>h",
    rhs = ":split<CR>",
    options = props.options,
    description = props.prefix .. "Split horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<leader>v",
    rhs = ":vsplit<CR>",
    options = props.options,
    description = props.prefix .. "Split vertically.",
  },
  {
    mode = { "n" },
    lhs = "<C-Up>",
    rhs = ":resize -2<CR>",
    options = props.options,
    description = props.prefix .. "Decrease split size horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<C-Down>",
    rhs = ":resize +2<CR>",
    options = props.options,
    description = props.prefix .. "Increase split size horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<C-Left>",
    rhs = ":vertical resize -2<CR>",
    options = props.options,
    description = props.prefix .. "Decrease split size vertically.",
  },
  {
    mode = { "n" },
    lhs = "<C-Right>",
    rhs = ":vertical resize +2<CR>",
    options = props.options,
    description = props.prefix .. "Increase split size vertically.",
  },
  {
    mode = { "n" },
    lhs = "<leader>H",
    rhs = "<C-w>H",
    options = props.options,
    description = props.prefix .. "Toggle split layout - Vertically.",
  },
  {
    mode = { "n" },
    lhs = "<leader>K",
    rhs = "<C-w>K",
    options = props.options,
    description = props.prefix .. "Toggle split layout - Horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<leader>=",
    rhs = "<C-w>=",
    options = props.options,
    description = props.prefix .. "Make splits size equal.",
  },
})

-- INFO: Mappings - Buffers...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<Tab>",
    rhs = ":bnext<CR>",
    options = props.options,
    description = props.prefix .. "Switch to next buffer.",
  },
  {
    mode = { "n" },
    lhs = "<S-Tab>",
    rhs = ":bprevious<CR>",
    options = props.options,
    description = props.prefix .. "Switch to previous buffer.",
  },
  {
    mode = { "n" },
    lhs = "<BS>",
    rhs = ":b#<CR>",
    options = props.options,
    description = props.prefix .. "Quickly switch between current and last open buffer.",
  },
})

-- INFO: Mappings - Basic Operations...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader><Esc>",
    rhs = ":qa!<cr>",
    options = props.options,
    description = props.prefix .. "Escape Neovim",
  },
  {
    mode = { "n" },
    lhs = "<C-w>",
    rhs = ":write<CR>",
    options = props.options,
    description = props.prefix .. "Write contents in the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<C-q>",
    rhs = ":quit<CR>",
    options = props.options,
    description = props.prefix .. "Close the current buffer.",
  },
})

-- INFO: Mappings - Better Navigation...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<C-u>",
    rhs = function()
      vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "kzz")
    end,
    options = props.options,
    description = props.prefix .. "Better navigation with C-u.",
  },
  {
    mode = { "n" },
    lhs = "<C-d>",
    rhs = function()
      vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "jzz")
    end,
    options = props.options,
    description = props.prefix .. "Better navigation with C-d.",
  },
  {
    mode = { "n", "x" },
    lhs = "k",
    rhs = function()
      return vim.v.count > 0 and "k" or "gk"
    end,
    options = props.options,
    description = props.prefix .. "Better movement with k.",
  },
  {
    mode = { "n", "x" },
    lhs = "j",
    rhs = function()
      return vim.v.count > 0 and "j" or "gj"
    end,
    options = props.options,
    description = props.prefix .. "Better movement with j.",
  },
  {
    mode = { "n", "x" },
    lhs = "H",
    rhs = function()
      return vim.v.count > 0 and "^" or "g^"
    end,
    options = props.options,
    description = props.prefix .. "Move to the first character at the beginning of the line.",
  },
  {
    mode = { "n", "x" },
    lhs = "L",
    rhs = function()
      return vim.v.count > 0 and "$" or "g$"
    end,
    options = props.options,
    description = props.prefix .. "Move to the last character at the end of the line.",
  },
})

-- INFO: Mappings - Search...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<Esc>",
    rhs = ":noh<CR>",
    options = props.options,
    description = props.prefix .. "Clear search highlight.",
  },
  {
    mode = { "n" },
    lhs = "<leader>rp",
    rhs = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    options = props.options,
    description = props.prefix .. "Replace current text inside the buffer.",
  },
})

-- INFO: Mappings - Spelling...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>cs",
    rhs = ":set spell!<CR>",
    options = props.options,
    description = props.prefix .. "Enable or disable spell checking.",
  },
})

-- INFO: Mappings - Better Editing...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "X",
    rhs = ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<CR>",
    options = { silent = true, noremap = true },
    description = props.prefix .. "Split current line at the cursor position.",
  },
  {
    mode = { "v" },
    lhs = "p",
    rhs = '"_dp"',
    options = props.options,
    description = props.prefix .. "paste in visual mode without writing to registers.",
  },
  {
    mode = { "v" },
    lhs = "P",
    rhs = '"_dP"',
    options = props.options,
    description = props.prefix .. "Paste in visual mode without writing to registers.",
  },
  {
    mode = { "n" },
    lhs = "YY",
    rhs = "va{Vy",
    options = props.options,
    description = props.prefix .. "Yank everything between and including { and }.",
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
    description = props.prefix .. "Delete empty lines without writing to registers.",
  },
  {
    mode = { "n" },
    lhs = "<C-a>",
    rhs = "ggVG",
    options = props.options,
    description = props.prefix .. "Select all the content from the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<C-y>",
    rhs = ":%y<CR>",
    options = props.options,
    description = props.prefix .. "Copy all the content from the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "+",
    rhs = "<C-a>",
    options = props.options,
    description = props.prefix .. "Increment number under the cursor.",
  },
  {
    mode = { "n" },
    lhs = "-",
    rhs = "<C-x>",
    options = props.options,
    description = props.prefix .. "Decrement number under the cursor.",
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
    options = { silent = true, noremap = true, expr = true },
    description = props.prefix .. "Automatically indent to the appropriate position, when entering insert mode.",
  },
  {
    mode = { "v" },
    lhs = ">",
    rhs = ">gv",
    options = props.options,
    description = props.prefix .. "Better forward indenting.",
  },
  {
    mode = { "v" },
    lhs = "<",
    rhs = "<gv",
    options = props.options,
    description = props.prefix .. "Better backwards indenting.",
  },
  {
    mode = { "n" },
    lhs = "<CR>",
    rhs = "ciw",
    options = props.options,
    description = props.prefix .. "Quickly edit word under cursor.",
  },
  {
    mode = { "n" },
    lhs = "<A-Down>",
    rhs = ":m .+1<CR>==",
    options = props.options,
    description = props.prefix .. "Move current line down.",
  },
  {
    mode = { "n" },
    lhs = "<A-Up>",
    rhs = ":m .-2<CR>==",
    options = props.options,
    description = props.prefix .. "Move current line up.",
  },
  {
    mode = { "i" },
    lhs = "<A-Down>",
    rhs = "<Esc>:m .+1<CR>==gi",
    options = props.options,
    description = props.prefix .. "Move current line down.",
  },
  {
    mode = { "i" },
    lhs = "<A-Up>",
    rhs = "<Esc>:m .-2<CR>==gi",
    options = props.options,
    description = props.prefix .. "Move current line up.",
  },
  {
    mode = { "v" },
    lhs = "<A-Down>",
    rhs = ":m '>+1<CR>gv=gv",
    options = props.options,
    description = props.prefix .. "Move current line down.",
  },
  {
    mode = { "v" },
    lhs = "<A-Up>",
    rhs = ":m '<-2<CR>gv=gv",
    options = props.options,
    description = props.prefix .. "Move current line down.",
  },
  {
    mode = { "v" },
    lhs = "y",
    rhs = "ygv<Esc>",
    options = props.options,
    description = props.prefix .. "Copy without returning to start of selection.",
  },
})

return M
