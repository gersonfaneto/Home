local base = require("minimal.utils.base")
local types = require("minimal.utils.types")

local M = {}

-- INFO: Mappings - Quick Edit...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>et",
    rhs = ":e ~/Notes/TODO.md<CR>",
    description = "TODOs.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ec",
    rhs = ":chdir ~/.config/nvim | e init.lua<CR>",
    description = "Configuration.",
  },
  {
    mode = { "n" },
    lhs = "<leader>es",
    rhs = ":chdir ~/.config/nvim | e lua/custom/settings.lua<CR>",
    description = "Settings.",
  },
}, { prefix = "Quick Edit: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Interface & Visuals...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>cc",
    rhs = function()
      ---@diagnostic disable-next-line: undefined-field
      if vim.opt.colorcolumn:get()[1] ~= nil then
        vim.opt.colorcolumn = nil
      else
        vim.opt.colorcolumn = types.settings.color_column
      end
    end,
    description = "Toggle color column.",
  },
}, { prefix = "UI: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Custom Commands...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>nn",
    rhs = ":NewNote<CR>",
    description = "Create a new note as a markdown file.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bn",
    rhs = ":BufferCreate<CR>",
    description = "Create a new buffer/file relative to the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bd",
    rhs = ":BufferDelete<CR>",
    description = "Delete the current Buffer while maintaining the window layout.",
  },
}, { prefix = "Custom Commands: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - File Management...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>fe",
    rhs = ":Ex<CR>",
    description = "File Explorer - Full.",
  },
  {
    mode = { "n" },
    lhs = "<leader>ve",
    rhs = ":25Lex<CR>",
    description = "File Explorer - Split.",
  },
}, { prefix = "File Management: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Splits & Windows...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>s",
    rhs = "<C-w>j",
    description = "Move to the split bellow.",
  },
  {
    mode = { "n" },
    lhs = "<leader>a",
    rhs = "<C-w>h",
    description = "Move to the split on the left.",
  },
  {
    mode = { "n" },
    lhs = "<leader>w",
    rhs = "<C-w>k",
    description = "Move to the split above.",
  },
  {
    mode = { "n" },
    lhs = "<leader>d",
    rhs = "<C-w>l",
    description = "Move to the split on the right.",
  },
  {
    mode = { "n" },
    lhs = "<leader>h",
    rhs = ":split<CR>",
    description = "Split horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<leader>v",
    rhs = ":vsplit<CR>",
    description = "Split vertically.",
  },
  {
    mode = { "n" },
    lhs = "<C-Up>",
    rhs = ":resize -2<CR>",
    description = "Decrease split size horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<C-Down>",
    rhs = ":resize +2<CR>",
    description = "Increase split size horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<C-Left>",
    rhs = ":vertical resize -2<CR>",
    description = "Decrease split size vertically.",
  },
  {
    mode = { "n" },
    lhs = "<C-Right>",
    rhs = ":vertical resize +2<CR>",
    description = "Increase split size vertically.",
  },
  {
    mode = { "n" },
    lhs = "<leader>H",
    rhs = "<C-w>H",
    description = "Toggle split layout - Vertically.",
  },
  {
    mode = { "n" },
    lhs = "<leader>K",
    rhs = "<C-w>K",
    description = "Toggle split layout - Horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<leader>=",
    rhs = "<C-w>=",
    description = "Make splits size equal.",
  },
}, { prefix = "Splits & Windows: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Buffers...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<Tab>",
    rhs = ":bnext<CR>",
    description = "Switch to next buffer.",
  },
  {
    mode = { "n" },
    lhs = "<S-Tab>",
    rhs = ":bprevious<CR>",
    description = "Switch to previous buffer.",
  },
  {
    mode = { "n" },
    lhs = "<BS>",
    rhs = ":b#<CR>",
    description = "Quickly switch between current and last open buffer.",
  },
  {
    mode = { "n" },
    lhs = "<leader>bo",
    rhs = ":%bd|e#|bd#<CR>",
    description = "Close all other buffers.",
  },
}, { prefix = "Buffers: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Basic Operations...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader><Esc>",
    rhs = ":qa!<cr>",
    description = "Escape Neovim",
  },
  {
    mode = { "n" },
    lhs = "<C-w>",
    rhs = ":write<CR>",
    description = "Write contents in the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<C-q>",
    rhs = ":quit<CR>",
    description = "Close the current buffer.",
  },
  {
    mode = { "n", "x" },
    lhs = ";",
    rhs = ":",
    options = { silent = false },
    description = "Enter command mode.",
  },
  {
    mode = { "n", "x" },
    lhs = "q;",
    rhs = "q:",
    options = { silent = false },
    description = "Open command window.",
  },
}, { prefix = "Basic Operations: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Better Navigation...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<C-u>",
    rhs = function()
      vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "kzz")
    end,
    description = "Better navigation with C-u.",
  },
  {
    mode = { "n" },
    lhs = "<C-d>",
    rhs = function()
      vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "jzz")
    end,
    description = "Better navigation with C-d.",
  },
  {
    mode = { "n", "x" },
    lhs = "k",
    rhs = function()
      return vim.v.count > 0 and "k" or "gk"
    end,
    options = { expr = true },
    description = "Better movement with k.",
  },
  {
    mode = { "n", "x" },
    lhs = "j",
    rhs = function()
      return vim.v.count > 0 and "j" or "gj"
    end,
    options = { expr = true },
    description = "Better movement with j.",
  },
  {
    mode = { "n", "x" },
    lhs = "H",
    rhs = function()
      return vim.v.count > 0 and "^" or "g^"
    end,
    options = { expr = true },
    description = "Move to the first character at the beginning of the line.",
  },
  {
    mode = { "n", "x" },
    lhs = "L",
    rhs = function()
      return vim.v.count > 0 and "$" or "g$"
    end,
    options = { expr = true },
    description = "Move to the last character at the end of the line.",
  },
}, { prefix = "Better Navigation: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Search...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<Esc>",
    rhs = ":noh<CR>",
    description = "Clear search highlight.",
  },
  {
    mode = { "n" },
    lhs = "<leader>rp",
    rhs = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    options = { silent = false },
    description = "Replace current text inside the buffer.",
  },
}, { prefix = "Search: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Spelling...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>cs",
    rhs = ":set spell!<CR>",
    description = "Enable or disable spell checking.",
  },
}, { prefix = "Spelling: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Better Editing...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "X",
    rhs = ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<CR>",
    description = "Split current line at the cursor position.",
  },
  {
    mode = { "v" },
    lhs = "p",
    rhs = '"_dp"',
    description = "Paste in visual mode without writing to registers.",
  },
  {
    mode = { "v" },
    lhs = "P",
    rhs = '"_dP"',
    description = "Paste in visual mode without writing to registers.",
  },
  {
    mode = { "n" },
    lhs = "YY",
    rhs = "va{Vy",
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
    description = "Select all the content from the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "<C-y>",
    rhs = ":%y<CR>",
    description = "Copy all the content from the current buffer.",
  },
  {
    mode = { "v" },
    lhs = "<C-s>",
    rhs = ":sort<CR>",
    description = "Sort the current selection.",
  },
  {
    mode = { "n" },
    lhs = "+",
    rhs = "<C-a>",
    description = "Increment number under the cursor.",
  },
  {
    mode = { "n" },
    lhs = "-",
    rhs = "<C-x>",
    description = "Decrement number under the cursor.",
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
    options = { expr = true },
    description = "Automatically indent to the appropriate position, when entering insert mode.",
  },
  {
    mode = { "v" },
    lhs = ">",
    rhs = ">gv",
    description = "Better forward indenting.",
  },
  {
    mode = { "v" },
    lhs = "<",
    rhs = "<gv",
    description = "Better backwards indenting.",
  },
  {
    mode = { "n" },
    lhs = "<CR>",
    rhs = "ciw",
    description = "Quickly edit word under cursor.",
  },
  {
    mode = { "n" },
    lhs = "<A-Down>",
    rhs = ":m .+1<CR>==",
    description = "Move current line down.",
  },
  {
    mode = { "n" },
    lhs = "<A-Up>",
    rhs = ":m .-2<CR>==",
    description = "Move current line up.",
  },
  {
    mode = { "i" },
    lhs = "<A-Down>",
    rhs = "<Esc>:m .+1<CR>==gi",
    description = "Move current line down.",
  },
  {
    mode = { "i" },
    lhs = "<A-Up>",
    rhs = "<Esc>:m .-2<CR>==gi",
    description = "Move current line up.",
  },
  {
    mode = { "v" },
    lhs = "<A-Down>",
    rhs = ":m '>+1<CR>gv=gv",
    description = "Move current line down.",
  },
  {
    mode = { "v" },
    lhs = "<A-Up>",
    rhs = ":m '<-2<CR>gv=gv",
    description = "Move current line down.",
  },
  {
    mode = { "v" },
    lhs = "y",
    rhs = "ygv<Esc>",
    description = "Copy without returning to start of selection.",
  },
}, { prefix = "Better Editing: ", options = { silent = true, noremap = true } })

return M
