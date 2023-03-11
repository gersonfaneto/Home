local keyMap = function(tMode, tKeys, tOutput, kDesc)
  local genOpts = { noremap = true, silent = true, desc = kDesc or "" }
  vim.keymap.set(tMode, tKeys, tOutput, genOpts)
end

keyMap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keyMap("n", "<leader>s", "<C-w>j", "Split - Move (Down)")
keyMap("n", "<leader>a", "<C-w>h", "Split - Move (Left)")
keyMap("n", "<leader>w", "<C-w>k", "Split - Move (Up)")
keyMap("n", "<leader>d", "<C-w>l", "Split - Move (Right)")

keyMap("n", "<C-Up>", ":resize -2<CR>", "Split - Resize Horizontally (-)")
keyMap("n", "<C-Down>", ":resize +2<CR>", "Split - Resize Horizontally (+)")
keyMap("n", "<C-Left>", ":vertical resize -2<CR>", "Split - Resize Vertically (-)")
keyMap("n", "<C-Right>", ":vertical resize +2<CR>", "Split - Resize Vertically (+)")

keyMap("n", "<TAB>", ":bnext<CR>", "Buffer - Next")
keyMap("n", "<S-TAB>", ":bprevious<CR>", "Buffer - Previous")
keyMap("n", "<leader>q", ":bprevious<CR>:bdelete #<CR>", "Buffer - Delete Current")

keyMap("n", "<leader>h", ":split<CR>", "Split - [H]orizontally")
keyMap("n", "<leader>v", ":vsplit<CR>", "Split - [V]ertically")

keyMap("n", "<C-w>", ":write<CR>", "Editor - [W]rite")
keyMap("n", "<C-q>", ":quit<CR>", "Editor - [Q]uit")

keyMap("n", "<A-Up>", "yy<S-p>j", "Editor - Duplicate Line (UP)")
keyMap("n", "<A-Down>", "yypk", "Editor - Duplicate Line (DOWN)")
keyMap("v", "p", '"_dP')

keyMap("n", "<C-a>", "ggVG", "Editor - Select All")
keyMap("n", "<C-y>", ":%y<CR>", "Editor - Copy All")
keyMap("n", "<leader>nh", ":noh<CR>", "Editor - [N]o [H]ighlight")

keyMap("v", "<", "<gv", "Editor - Indent Line (LEFT)")
keyMap("v", ">", ">gv", "Editor - Indent Line (RIGHT)")

keyMap("n", "+", "<C-a>", "Editor - Increment")
keyMap("n", "+", "<C-a>", "Editor - Increment")

keyMap("n", "<F11>", ":set spell<CR>", "Editor - Enable Spell Check")
keyMap("n", "<F12>", ":set nospell<CR>", "Editor - Disable Spell Check")
