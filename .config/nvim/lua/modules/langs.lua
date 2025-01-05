return {
  {
    'p00f/clangd_extensions.nvim',
    ft = { 'c', 'cpp' },
    config = function()
      require('configs.clangd_extensions')
    end,
  },

  {
    'nvim-java/nvim-java',
    ft = { 'java' },
    config = function()
      require('configs.java')
    end
  }
}
