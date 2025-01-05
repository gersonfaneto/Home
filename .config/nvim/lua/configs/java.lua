require('java').setup({
  jdk = {
    auto_install = false,
  },
  notifications = {
    dap = false,
  },
})

require('lspconfig').jdtls.setup({
  handlers = {
    ['$/progress'] = function() end,
  },
})
