local M = {}

M.g = {
  -- Leader.
  mapleader = " ",
  maplocalleader = " ",
}

M.opt = {
  -- Behavior.
  hidden = true,
  errorbells = false,
  swapfile = false,
  backup = false,
  writebackup = false,
  undofile = true,
  undodir = os.getenv("HOME") .. "/.cache/nvim/undodir",
  backspace = "indent,eol,start",
  splitright = true,
  splitbelow = true,
  autochdir = false,
  modifiable = true,
  encoding = "UTF-8",

  -- Encoding.
  fileencoding = "utf-8",

  -- Spell Checking.
  spell = false,
  spelllang = { "en_us", "pt_br" },

  -- Folding.
  foldlevel = 99,
  foldlevelstart = 99,
  foldcolumn = "0",
  foldenable = true,

  -- Appearance.
  number = utils.types.settings.show_line_numbers,
  relativenumber = utils.types.settings.show_line_numbers,
  termguicolors = true,
  colorcolumn = utils.types.settings.show_color_column and utils.types.settings.color_column or "",
  signcolumn = "yes",
  cmdheight = 1,
  scrolloff = 10,
  pumheight = 10,
  conceallevel = 0,
  showmode = false,
  showtabline = 0,
  numberwidth = 4,
  fillchars = "eob: ,fold: ,foldopen: ,foldsep: ,foldclose:",
  list = true,
  listchars = {
    tab = "⇥ ",
    leadmultispace = "┊ ",
    trail = "␣",
    nbsp = "⍽",
    eol = "↴",
    space = "⋅",
  },
  completeopt = { "menu", "menuone", "noselect" },
  laststatus = 3,

  -- Tabs / Indentation.
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
  smartindent = true,
  wrap = false,

  -- Search.
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  hlsearch = true,

  -- Responsiveness.
  timeoutlen = 300,
  updatetime = 100,
}

-- Random...
vim.opt.mouse:append("a")
vim.opt.iskeyword:append("-")
vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")
vim.opt.diffopt:append("vertical")
vim.opt.clipboard:append("unnamedplus")

for prefix, tbl in pairs(M) do
  for key, value in pairs(tbl) do
    vim[prefix][key] = value
  end
end

return M
