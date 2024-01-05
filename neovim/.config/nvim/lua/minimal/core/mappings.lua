local base = require("minimal.utils.base")
local types = require("minimal.utils.types")

local M = {}

-- INFO: Mappings - Quick Toggles...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<C-t><C-r>",
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
  {
    mode = { "n" },
    lhs = "<C-t><C-l>",
    rhs = ":set cursorline!<CR>",
    description = "Toggle cursor line.",
  },
  {
    mode = { "n" },
    lhs = "<C-t><C-d>",
    rhs = ":set list!<CR>",
    description = "Toggle list.",
  },
  {
    mode = { "n" },
    lhs = "<C-t><C-s>",
    rhs = ":set spell!<CR>",
    description = "Toggle spell checking.",
  },
}, { prefix = "Quick Toggles: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Custom Commands...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<leader>nn",
    rhs = ":NewNote<CR>",
    description = "Create a new note.",
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

-- INFO: Mappings - Splits & Windows...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "<C-Down>",
    rhs = "<C-w>j",
    description = "Move to the split bellow.",
  },
  {
    mode = { "n" },
    lhs = "<C-Left>",
    rhs = "<C-w>h",
    description = "Move to the split on the left.",
  },
  {
    mode = { "n" },
    lhs = "<C-Up>",
    rhs = "<C-w>k",
    description = "Move to the split above.",
  },
  {
    mode = { "n" },
    lhs = "<C-Right>",
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
    lhs = "<S-Up>",
    rhs = function()
      local size = math.ceil(vim.api.nvim_win_get_height(0) / 10)
      vim.cmd("resize +" .. size)
    end,
    description = "Decrease split size horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<S-Down>",
    rhs = function()
      local size = math.ceil(vim.api.nvim_win_get_height(0) / 10)
      vim.cmd("resize -" .. size)
    end,
    description = "Increase split size horizontally.",
  },
  {
    mode = { "n" },
    lhs = "<S-Left>",
    rhs = function()
      local size = math.ceil(vim.api.nvim_win_get_width(0) / 10)
      vim.cmd("vertical resize +" .. size)
    end,
    description = "Decrease split size vertically.",
  },
  {
    mode = { "n" },
    lhs = "<S-Right>",
    rhs = function()
      local size = math.ceil(vim.api.nvim_win_get_width(0) / 10)
      vim.cmd("vertical resize -" .. size)
    end,
    description = "Increase split size vertically.",
  },
}, { prefix = "Splits & Windows: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Buffers...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "[b",
    rhs = ":bnext<CR>",
    options = { noremap = false },
    description = "Switch to next buffer.",
  },
  {
    mode = { "n" },
    lhs = "]b",
    rhs = ":bprevious<CR>",
    options = { noremap = false },
    description = "Switch to previous buffer.",
  },
  {
    mode = { "n" },
    lhs = ",b",
    rhs = ":b#<CR>",
    description = "Quickly switch between current and last open buffer.",
  },
}, { prefix = "Buffers: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Basic Operations...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "W",
    rhs = ":write<CR>",
    description = "Write the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "Q",
    rhs = ":quit<CR>",
    description = "Close the current buffer.",
  },
  {
    mode = { "n" },
    lhs = "E",
    rhs = ":quitall<CR>",
    description = "Close all buffers and exit.",
  },
  {
    mode = { "n" },
    lhs = "T",
    rhs = ":term<CR>",
    description = "Open terminal.",
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
  {
    mode = { "n" },
    lhs = "<leader>sa",
    rhs = "1z=",
    options = { silent = false },
    description = "Accept first suggestion for spelling correction.",
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

-- INFO: Mappings - Search & Replace ...
base.mappings.bulk_register({
  {
    mode = { "x" },
    lhs = "//",
    rhs = 'y/<C-r>"<CR>',
    description = "Search for selected text.",
  },
  {
    mode = { "n" },
    lhs = "n",
    rhs = "nzzzv",
    description = "Foward.",
  },
  {
    mode = { "n" },
    lhs = "N",
    rhs = "Nzzzv",
    description = "Backward.",
  },
  {
    mode = { "n" },
    lhs = "<ESC>",
    rhs = ":noh<CR>",
    description = "Clear search highlight.",
  },
  {
    mode = { "n" },
    lhs = "<leader>rw",
    rhs = function()
      local previous = vim.fn.expand("<cword>")

      vim.ui.input({ prompt = " Replace ", default = previous }, function(replacement)
        if replacement ~= nil then
          vim.cmd("%s/" .. previous .. "/" .. replacement .. "/gI")
        end
      end)
    end,
    options = { silent = false },
    description = "Replace the word under the cursor in the current buffer.",
  },
}, { prefix = "Search & Replace: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Better Editing...
base.mappings.bulk_register({
  {
    mode = { "n" },
    lhs = "sa",
    rhs = "ggVG",
    description = "Select all the content from the current buffer.",
  },
  {
    mode = { "x" },
    lhs = "ss",
    rhs = ":sort<CR>",
    description = "Sort the current selection.",
  },
  {
    mode = { "i" },
    lhs = "<C-v>",
    rhs = "<C-r>+",
    description = "Paste in insert mode.",
  },
  {
    mode = { "x" },
    lhs = "p",
    rhs = '"_dp"',
    description = "Paste in visual mode without writing to registers.",
  },
  {
    mode = { "x" },
    lhs = "P",
    rhs = '"_dP"',
    description = "Paste in visual mode without writing to registers.",
  },
  {
    mode = { "x" },
    lhs = "y",
    rhs = "ygv<Esc>",
    description = "Copy without returning to start of selection.",
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
    mode = { "n", "x" },
    lhs = "<Tab>",
    rhs = function()
      local mode = vim.api.nvim_get_mode().mode

      if mode == "n" then
        vim.cmd.normal(">>")
      else
        vim.cmd.normal(">gv")
      end
    end,
    description = "Better forward indenting.",
  },
  {
    mode = { "n", "x" },
    lhs = "<S-Tab>",
    rhs = function()
      local mode = vim.api.nvim_get_mode().mode

      if mode == "n" then
        vim.cmd.normal("<<")
      else
        vim.cmd.normal("<gv")
      end
    end,
    description = "Better backwards indenting.",
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
    mode = { "x" },
    lhs = "<A-Down>",
    rhs = ":m '>+1<CR>gv=gv",
    description = "Move current line down.",
  },
  {
    mode = { "x" },
    lhs = "<A-Up>",
    rhs = ":m '<-2<CR>gv=gv",
    description = "Move current line down.",
  },
}, { prefix = "Better Editing: ", options = { silent = true, noremap = true } })

-- INFO: Mappings - Custom Text Objects...
base.mappings.bulk_register({
  {
    mode = { "x" },
    lhs = "al",
    rhs = ":<c-u>silent! normal! 0v$<cr>",
    description = "Around the whole line.",
  },
  {
    mode = { "o" },
    lhs = "al",
    rhs = ":normal val<cr>",
    description = "Around the whole line.",
  },

  {
    mode = { "x" },
    lhs = "il",
    rhs = ":<c-u>silent! normal! ^vg_<cr>",
    description = "Inside the whole line.",
  },
  {
    mode = { "o" },
    lhs = "il",
    rhs = ":normal vil<cr>",
    description = "Inside the whole line.",
  },

  {
    mode = { "x" },
    lhs = "ae",
    rhs = [[:<c-u>silent! normal! m'gg0VG$<cr>]],
    description = "Around the whole file.",
  },
  {
    mode = { "o" },
    lhs = "ae",
    rhs = ":normal Vae<cr>",
    description = "Around the whole file.",
  },
}, { prefix = "Custom Text Objects: ", options = { silent = true, noremap = true } })

return M
