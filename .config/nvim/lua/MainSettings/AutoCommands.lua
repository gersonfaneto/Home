local autoCMD = vim.api.nvim_create_autocmd

local LangMaps = {
  cpp = { build = "g++ % -o %:r", exec = "./%:r" },
  cs = { build = "dotnet build", exec = "dotnet run" },
  c = { build = "gcc % -o %:r", exec = "./%:r" },
  java = { build = "javac %", exec = "java %:r" },
  python = { exec = "python %" },
  sh = { exec = "./%" },
  typescript = { build = "tsc %", exec = "node %:r.js" },
  javascript = { exec = "node %" },
}

for langType, langInfo in pairs(LangMaps) do
  if langInfo.build ~= nil then
    autoCMD("FileType", {
      command = "nnoremap <F5> :!" .. langInfo.build .. "<CR>",
      pattern = langType,
    })
  end
  autoCMD("FileType", {
    command = "nnoremap <F6> :split<CR>:terminal " .. langInfo.exec .. "<CR>",
    pattern = langType,
  })
end

autoCMD("InsertEnter", {
  command = "set norelativenumber",
  pattern = "*",
})

autoCMD("InsertLeave", {
  command = "set relativenumber",
  pattern = "*",
})

autoCMD("BufEnter", {
  command = "highlight Pmenu guibg=NONE",
  pattern = "*",
})

autoCMD("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300,
    })
  end,
})

autoCMD("BufWritePost", {
  pattern = { "*.java" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})
