---@diagnostic disable: need-check-nil
local api = require("utils.api")
local plugins_nvim_lspconfig = require("utils.plugins.nvim-lspconfig")

local _, jdtls = pcall(require, "jdtls")
local _, jdtls_setup = pcall(require, "jdtls.setup")

local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

local function capabilities()
  local default_capabilities = vim.lsp.protocol.make_client_capabilities()
  default_capabilities.textDocument.completion.completionItem.snippetSupport = true
  default_capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  return default_capabilities
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local function directory_exists(path)
  local f = io.popen("cd " .. path)
  local ff = f:read("*all")

  if ff:find("ItemNotFoundException") then
    return false
  else
    return true
  end
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = jdtls_setup.find_root(root_markers)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
if directory_exists(workspace_dir) then
else
  os.execute("mkdir " .. workspace_dir)
end

local config = {
  cmd = {
    "/usr/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. jdtls_path .. "/lombok.jar",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    jdtls_path .. "/config_linux",
    "-data",
    workspace_dir,
  },

  capabilities = capabilities(),
  root_dir = root_dir,

  settings = {
    java = {
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = false,
      },
    },
    signatureHelp = {
      enabled = true,
    },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org",
      },
    },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = {},
  },
}

local function on_attach()
  api.maps.bulk_register({
    {
      mode = { "n" },
      lhs = "<leader>la",
      rhs = vim.lsp.buf.code_action,
      options = { noremap = true, silent = true },
      description = "Show code actions.",
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
    {
      mode = { "n" },
      lhs = "<leader>oi",
      rhs = jdtls.organize_imports,
      options = { noremap = true, silent = true },
      description = "Organize imports.",
    },
    {
      mode = { "n" },
      lhs = "<leader>ev",
      rhs = jdtls.extract_variable,
      options = { noremap = true, silent = true },
      description = "Extract to variable.",
    },
    {
      mode = { "n" },
      lhs = "<leader>ec",
      rhs = jdtls.extract_constant,
      options = { noremap = true, silent = true },
      description = "Extract to constant.",
    },
    {
      mode = { "v" },
      lhs = "<leader>em",
      rhs = "<Esc>:lua require('jdtls').extract_method(true)<CR>",
      options = { noremap = true, silent = true },
      description = "Extract to method.",
    },
  })
  local _ = pcall(require, vim.lsp.codelens.refresh)
end

config["on_attach"] = on_attach()

jdtls.start_or_attach(config)
