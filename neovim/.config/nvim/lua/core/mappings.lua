local maps = require("utils.api").maps

maps.bulk_register({
	{
		mode = { "n" },
		lhs = "<leader>e",
		rhs = ":Ex<CR>",
		options = { silent = true },
		description = "File Explorer.",
	},
  {
    mode = { "n" },
    lhs = "<leader><Esc>",
    rhs = ":qa!<cr>",
    options = { silent = true },
    description = "Escape Neovim",
  },
  {
    mode = { "n" },
    lhs = "<Esc>",
    rhs = ":noh<CR>",
    options = { silent = true },
    description = "Clear search highlight.",
  },
  {
    mode = { "n" },
    lhs = "<leader>cs",
    rhs = ":set spell!<CR>",
    options = { silent = true },
    description = "Enable or disable spell checking.",
  },
	{
		mode = { "n" },
		lhs = "<leader>s",
		rhs = "<C-w>j",
		options = { silent = true },
		description = "Move to the split bellow.",
	},
	{
		mode = { "n" },
		lhs = "<leader>a",
		rhs = "<C-w>h",
		options = { silent = true },
		description = "Move to the split on the left.",
	},
	{
		mode = { "n" },
		lhs = "<leader>w",
		rhs = "<C-w>k",
		options = { silent = true },
		description = "Move to the split above.",
	},
	{
		mode = { "n" },
		lhs = "<leader>d",
		rhs = "<C-w>l",
		options = { silent = true },
		description = "Move to the split on the right.",
	},
	{
		mode = { "n" },
		lhs = "<C-Up>",
		rhs = ":resize -2<CR>",
		options = { silent = true },
		description = "Decrease split size horizontally.",
	},
	{
		mode = { "n" },
		lhs = "<C-Down>",
		rhs = ":resize +2<CR>",
		options = { silent = true },
		description = "Increase split size horizontally.",
	},
	{
		mode = { "n" },
		lhs = "<C-Left>",
		rhs = ":vertical resize -2<CR>",
		options = { silent = true },
		description = "Decrease split size vertically.",
	},
	{
		mode = { "n" },
		lhs = "<C-Right>",
		rhs = ":vertical resize +2<CR>",
		options = { silent = true },
		description = "Increase split size vertically.",
	},
	{
		mode = { "n" },
		lhs = "<Tab>",
		rhs = ":bnext<CR>",
		options = { silent = true },
		description = "Switch to next buffer.",
	},
	{
		mode = { "n" },
		lhs = "<S-Tab>",
		rhs = ":bprevious<CR>",
		options = { silent = true },
		description = "Switch to previous buffer.",
	},
	{
		mode = { "n" },
		lhs = "<leader>q",
		rhs = ":bprevious<CR>:bdelete #<CR>",
		options = { silent = true },
		description = "Kill current buffer and switch to previous one.",
	},
	{
		mode = { "n" },
		lhs = "<leader>h",
		rhs = ":split<CR>",
		options = { silent = true },
		description = "Split horizontally.",
	},
	{
		mode = { "n" },
		lhs = "<leader>v",
		rhs = ":vsplit<CR>",
		options = { silent = true },
		description = "Split vertically.",
	},
	{
		mode = { "n" },
		lhs = "<C-w>",
		rhs = ":write<CR>",
		options = { silent = true },
		description = "Write contents in the current buffer.",
	},
	{
		mode = { "n" },
		lhs = "<C-q>",
		rhs = ":quit<CR>",
		options = { silent = true },
		description = "Close the current buffer.",
	},
	{
		mode = { "v" },
		lhs = "p",
		rhs = "_dP",
		options = { silent = true },
		description = "Paste in visual mode without writing to registers.",
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
		options = { silent = true },
		description = "Select all the content from the current buffer.",
	},
	{
		mode = { "n" },
		lhs = "<C-y>",
		rhs = ":%y<CR>",
		options = { silent = true },
		description = "Copy all the content from the current buffer.",
	},
	{
    mode = { "n" },
    lhs = "+",
		rhs = "<C-a>",
		options = { silent = true },
		description = "Increment number under the cursor.",
	},
	{
		mode = { "n" },
		lhs = "-",
		rhs = "<C-x>",
		options = { silent = true },
		description = "Decrement number under the cursor.",
	},
  {
    mode = { "n" },
    lhs = "<C-u>",
    rhs = function()
      vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "k")
    end,
    options = { silent = true },
    description = "Better navigation with C-u.",
  },
  {
    mode = { "n" },
    lhs = "<C-d>",
    rhs = function()
      vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "j")
    end,
    options = { silent = true },
    description = "Better navigation with C-d.",
  },
  {
    mode = { "n", "x" },
    lhs = "k",
    rhs = function()
      return vim.v.count > 0 and "k" or "gk"
    end,
    options = { silent = true, expr = true },
    description = "Better movement with k.",
  },
  {
    mode = { "n", "x" },
    lhs = "j",
    rhs = function()
      return vim.v.count > 0 and "j" or "gj"
    end,
    options = { silent = true, expr = true },
    description = "Better movement with j.",
  },
  {
    mode = { "n", "x" },
    lhs = "H",
    rhs = function()
      return vim.v.count > 0 and "^" or "g^"
    end,
    options = { silent = true, expr = true },
    description = "Move to the first character at the beginning of the line.",
  },
  {
    mode = { "n", "x" },
    lhs = "L",
    rhs = function()
      return vim.v.count > 0 and "$" or "g$"
    end,
    options = { silent = true, expr = true },
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
    options = { expr = true },
    description = "Automatically indent to the appropriate position, when entering insert mode.",
  },
})

return M
