local hadSuccess, TreeSitter = pcall(require, "nvim-treesitter.configs")
if not hadSuccess then
  return
end

TreeSitter.setup({
  ensure_installed = {
    "lua",
    "c",
    "cpp",
    "c_sharp",
    "java",
    "rust",
    "python",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "fish",
    "gitcommit",
    "gitignore",
    "verilog",
  },
  sync_install = false,
  auto_install = true,
  auto_tag = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extented_mode = true,
    max_file_lines = nil,
  },
})
