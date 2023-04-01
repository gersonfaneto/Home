local autoCMD = require("Utils.Shorts").autoCMD

local LangMaps = {
  cpp = { build = "g++ % -o %:r", exec = "./%:r" },
  cs = { build = "dotnet build", exec = "dotnet run" },
  c = { build = "gcc % -o %:r", exec = "./%:r" },
  python = { exec = "python %" },
  typescript = { build = "tsc %", exec = "node %:r.js" },
  javascript = { exec = "node %" },
  sh = { exec = "./%" },
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

autoCMD("BufEnter", {
  command = "lua require('PluginsSettings.KeyBindings').LiveServers()",
  pattern = { "*.md", "*.html" },
})

autoCMD("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300,
    })
  end,
})
