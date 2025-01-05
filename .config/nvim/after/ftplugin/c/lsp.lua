require('utils.lsp').start({
  cmd = {
    'clangd',
    '--fallback-style=WebKit',
  },
  root_patterns = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
  },
})
