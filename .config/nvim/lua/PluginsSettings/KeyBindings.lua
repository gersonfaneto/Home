local KeyBindings = {}

local keyMap = function(tMode, tKeys, tOutput, kDesc, tBufnr)
  vim.keymap.set(tMode, tKeys, tOutput, { noremap = true, silent = true, desc = kDesc or "", buffer = tBufnr })
end

function DiscordStatus()
  package.loaded.presence:stop()
  vim.notify("Discord Presence Disabled!")
end

function KeyBindings.DiscordToggle()
  keyMap("n", "<leader>pd", ":lua DiscordStatus()<CR>", "Discord [P]resence [D]isable")
end

function KeyBindings.MarkdownPreview()
  keyMap("n", "<leader>ms", ":MarkdownPreview<CR>", "Live Servers - [M]arkdown [S]tart")
  keyMap("n", "<leader>me", ":MarkdownPreviewStop<CR>", "Live Servers - [M]arkdown [E]nd")
end

function KeyBindings.GitKeys(_)
  local GitSigns = package.loaded.gitsigns
  keyMap("n", "<leader>tb", ":GitBlameToggle<CR>", "Git - [T]oggle [B]lame")
  keyMap("n", "<leader>oc", ":GitBlameOpenCommitURL<CR>", "Git - [O]pen [C]ommit")
  keyMap("n", "<leader>ph", GitSigns.preview_hunk, "Git - [P]review [H]unk")
  keyMap("n", "<leader>bl", function()
    GitSigns.blame_line({ full = true })
  end, "Git - [B]lame [L]ine")
  keyMap("n", "<leader>dt", GitSigns.diffthis, "Git - [D]iff [T]his")
  keyMap("n", "<leader>dT", function()
    GitSigns.diffthis("~")
  end, "Git = [D]iff [T]his")
end

function KeyBindings.DashboardKeys()
  keyMap("n", "<leader>o", ":DashboardNewFile<CR>", "[O]pen New File")
  keyMap("n", "<leader>m", ":Dashboard<CR>", "Main [M]enu")
end

function KeyBindings.NvimTreeKeys()
  keyMap("n", "<F2>", ":NvimTreeToggle<CR>", "NvimTree - Toggle")
  keyMap("n", "<F3>", ":NvimTreeFocus<CR>", "NvimTree - Focus")
end

function KeyBindings.TelescopeKeys()
  keyMap("n", "<leader><leader>", ":Telescope<CR>", "Telescope - Browse")
  keyMap("n", "<leader>fk", ":Telescope keymaps<CR>", "Telescope - [F]ind [K]eybindings")
  keyMap("n", "<leader>ff", ":Telescope find_files<CR>", "Telescope - [F]ind [F]iles")
  keyMap("n", "<leader>fb", ":Telescope file_browser<CR>", "Telescope - [F]ile [B]rowser")
  keyMap("n", "<leader>lg", ":Telescope live_grep<CR>", "Telescope - [L]ive [G]rep")
  keyMap("n", "<leader><TAB>", ":Telescope buffers<CR>", "Telescope - Browse Buffers")
  keyMap("n", "<leader>tt", ":TodoTelescope<CR>", "[T]odos [T]elescope")
end

function KeyBindings.LSPKeys(bufnr)
  keyMap("n", "K", vim.lsp.buf.hover, "LSP - Hover", bufnr)
  keyMap("n", "<C-k>", vim.lsp.buf.signature_help, "LSP - Signature Help", bufnr)
  keyMap("n", "gr", ":Telescope lsp_references<CR>", "LSP - [G]oto [R]eferences", bufnr)
  keyMap("n", "gd", ":Telescope lsp_definitions<CR>", "LSP - [G]oto [D]efinition", bufnr)
  keyMap("n", "gi", ":Telescope lsp_implementations<CR>", "LSP - [G]oto [I]mplementations", bufnr)
  keyMap("n", "rn", vim.lsp.buf.rename, "LSP - [R]ename", bufnr)
  keyMap("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, "LSP - [C]ode [F]ormat")
  keyMap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP - [C]ode [A]ctions", bufnr)
  keyMap("n", "vd", ":Telescope diagnostics<CR>", "LSP - [V]iew [D]iagnostics", bufnr)
  keyMap("n", "]d", vim.diagnostic.goto_next, "LSP - Next [D]iagnostic", bufnr)
  keyMap("n", "[d", vim.diagnostic.goto_prev, "LSP - Previous [D]iagnostic", bufnr)
  keyMap("n", "of", vim.diagnostic.open_float, "LSP - Previous [D]iagnostic", bufnr)
  keyMap("n", "<leader>bs", ":Telescope lsp_document_symbols<CR>", "LSP - [B]rowse [S]ymbols", bufnr)
end

function KeyBindings.JavaKeys(bufnr)
  KeyBindings.LSPKeys(bufnr)
  keyMap("n", "<leader>oi", ":lua require('jdtls').organize_imports()<CR>", "Java - [O]rganize [I]mports", bufnr)
  keyMap("n", "<leader>ev", ":lua require('jdtls').extract_variable()<CR>", "Java - [E]xtract [V]ariable", bufnr)
  keyMap("n", "<leader>ec", ":lua require('jdtls').extract_constant()<CR>", "Java - [E]xtract [C]onstant", bufnr)
  keyMap(
    "v",
    "<leader>em",
    [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
    "Java - [E]xtract [M]ethod",
    bufnr
  )
end

function KeyBindings.RustKeys(bufnr)
  KeyBindings.LSPKeys(bufnr)
  keyMap(
    "n",
    "<leader>ha",
    ":lua require('rust-tools').hover_actions.hover_actions()<CR>",
    "Rust - [H]over [A]ctions",
    bufnr
  )
  keyMap(
    "n",
    "<leader>ra",
    ":lua require('rust-tools').code_action_group.code_action_group()<CR>",
    "Rust - [R]ust [A]ctions",
    bufnr
  )
end

return KeyBindings
