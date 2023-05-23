local api = require("utils.api")
local plugins_nvim_lsputils = require("utils.plugins.nvim-lsputils")
local plugins_nvim_lspconfig = require("utils.plugins.nvim-lspconfig")

local M = {
  requires = {
    "lspconfig",
    "mason-lspconfig",
  },
  disabled_servers = {
    -- "pyright",
    "pylance",
  },
  server_configurations_dir_path = api.paths.join("configs", "lsp", "server-configs"),
}

function M.before()
  M.register_key()
end

function M.load()
  plugins_nvim_lspconfig.begin()

  -- lspconfig_to_mason or mason_to_lspconfig
  local mappings = M.mason_lspconfig.get_mappings()

  -- load build-in servers and expands servers
  local servers = vim.tbl_deep_extend(
    "force",
    M.mason_lspconfig.get_installed_servers(),
    plugins_nvim_lspconfig.get_expands_servers()
  )

  for _, server_name in ipairs(servers) do
    if not vim.tbl_contains(M.disabled_servers, server_name) then
      local require_path =
        api.paths.join(M.server_configurations_dir_path, mappings.lspconfig_to_mason[server_name] or server_name)

      local ok, configuration = pcall(require, require_path)

      -- set default configuration
      configuration = plugins_nvim_lspconfig.get_configuration(ok, configuration)
      configuration.handlers = plugins_nvim_lspconfig.get_headlers(configuration)
      configuration.capabilities = plugins_nvim_lspconfig.get_capabilities(configuration)

      local private_on_init = configuration.on_init
      local private_on_attach = configuration.on_attach

      configuration.on_init = function(client, bufnr)
        private_on_init(client, bufnr)
      end

      configuration.on_attach = function(client, bufnr)
        M.nvim_navic.attach(client, bufnr)
        plugins_nvim_lsputils.close_document_format(client)
        pcall(plugins_nvim_lsputils.close_semantic_tokens, client)
        -- run private_on_attach
        private_on_attach(client, bufnr)
      end

      M.lspconfig[server_name].setup(configuration)
    end
  end
end

function M.after() end

function M.register_key()
  api.maps.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>la",
      rhs = vim.lsp.buf.code_action,
      options = { noremap = true, silent = true },
      description = "Show code action.",
    },
    {
      mode = { "n" },
      lhs = "<leader>rn",
      rhs = vim.lsp.buf.rename,
      options = { noremap = true, silent = true },
      description = "Variable renaming.",
    },
    {
      mode = { "n" },
      lhs = "<leader>lf",
      rhs = function()
        vim.lsp.buf.format({ async = true })
      end,
      options = { noremap = true, silent = true },
      description = "Format buffer.",
    },
    {
      mode = { "n" },
      lhs = "gh",
      rhs = vim.lsp.buf.hover,
      options = { noremap = true, silent = true },
      description = "Show help information.",
    },
    {
      mode = { "n" },
      lhs = "gr",
      rhs = function()
        require("telescope.builtin").lsp_references()
      end,
      options = { noremap = true, silent = true },
      description = "Go to references.",
    },
    {
      mode = { "n" },
      lhs = "gi",
      rhs = function()
        require("telescope.builtin").lsp_implementations()
      end,
      options = { noremap = true, silent = true },

      description = "Go to implementations.",
    },
    {
      mode = { "n" },
      lhs = "gd",
      rhs = function()
        require("telescope.builtin").lsp_definitions()
      end,
      options = { noremap = true, silent = true },
      description = "Go to definitions.",
    },
    {
      mode = { "n" },
      lhs = "gD",
      rhs = function()
        require("telescope.builtin").lsp_type_definitions()
      end,
      options = { noremap = true, silent = true },
      description = "Go to type definitions.",
    },
    {
      mode = { "n" },
      lhs = "of",
      rhs = plugins_nvim_lspconfig.diagnostic_open_float,
      options = { noremap = true, silent = true },
      description = "Show Current Diagnostics.",
    },
    {
      mode = { "n" },
      lhs = "<leader>td",
      rhs = function()
        require("telescope.builtin").diagnostics()
      end,
      options = { noremap = true, silent = true },
      description = "Show Workspace Diagnostics.",
    },
    {
      mode = { "n" },
      lhs = "[d",
      rhs = plugins_nvim_lspconfig.goto_prev_diagnostic,
      options = { noremap = true, silent = true },
      description = "Jump to previous diagnostic.",
    },
    {
      mode = { "n" },
      lhs = "]d",
      rhs = plugins_nvim_lspconfig.goto_next_diagnostic,
      options = { noremap = true, silent = true },
      description = "Jump to next diagnostic.",
    },
    {
      mode = { "i" },
      lhs = "<C-j>",
      rhs = plugins_nvim_lspconfig.toggle_sigature_help,
      options = { noremap = true, silent = true },
      description = "Toggle signature help.",
    },
    {
      mode = { "i", "n" },
      lhs = "<C-b>",
      rhs = plugins_nvim_lspconfig.scroll_docs_to_up("<C-b>"),
      options = { noremap = true, silent = true },
      description = "Scroll up floating window.",
    },
    {
      mode = { "i", "n" },
      lhs = "<C-f>",
      rhs = plugins_nvim_lspconfig.scroll_docs_to_down("<C-f>"),
      options = { noremap = true, silent = true },
      description = "Scroll down floating window.",
    },
  })
end

return M
