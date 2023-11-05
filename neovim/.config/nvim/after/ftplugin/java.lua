local base = require("minimal.utils.base")

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

  ---@diagnostic disable-next-line: need-check-nil
  local ff = f:read("*all")

  if ff:find("ItemNotFoundException") then
    return false
  else
    return true
  end
end

local root_markers = {
  ".git",
  "mvnw",
  "gradlew",
  "pom.xml",
  "build.gradle",
}
local root_dir = jdtls_setup.find_root(root_markers)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name

if not directory_exists(workspace_dir) then
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
        "org.junit.jupiter.base.Assertions.*",
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
  local opts = { noremap = true, silent = true }

  base.mappings.bulk_register({
    {
      mode = { "n", "v" },
      lhs = "<leader>la",
      rhs = ":Lspsaga code_action<CR>",
      options = opts,
      description = "Show code actions.",
    },
    {
      mode = { "n" },
      lhs = "<leader>rn",
      rhs = ":Lspsaga rename<CR>",
      options = opts,
      description = "Rename symbol under cursor.",
    },
    {
      mode = { "n" },
      lhs = "K",
      rhs = ":Lspsaga hover_doc<CR>",
      options = opts,
      description = "Show help information.",
    },
    {
      mode = { "n" },
      lhs = "gr",
      rhs = ":Lspsaga finder<CR>",
      options = opts,
      description = "Go to references.",
    },
    {
      mode = { "n" },
      lhs = "gi",
      rhs = function()
        require("telescope.builtin").lsp_implementations()
      end,
      options = opts,

      description = "Go to implementations.",
    },
    {
      mode = { "n" },
      lhs = "gd",
      rhs = ":Lspsaga peek_definition<CR>",
      options = opts,
      description = "Peek type definition.",
    },
    {
      mode = { "n" },
      lhs = "gD",
      rhs = ":Lspsaga goto_definition<CR>",
      options = opts,
      description = "Go to type definition.",
    },
    {
      mode = { "n" },
      lhs = "<leader>ld",
      rhs = ":Lspsaga show_line_diagnostics<CR>",
      options = opts,
      description = "Show current line diagnostics.",
    },
    {
      mode = { "n" },
      lhs = "<leader>cd",
      rhs = ":Lspsaga show_cursor_diagnostics<CR>",
      options = opts,
      description = "Show diagnostics under cursor.",
    },
    {
      mode = { "n" },
      lhs = "<leader>fd",
      rhs = function()
        require("telescope.builtin").diagnostics()
      end,
      options = opts,
      description = "Find project diagnostics.",
    },
    {
      mode = { "n" },
      lhs = "[d",
      rhs = ":Lspsaga diagnostic_jump_prev<CR>",
      options = opts,
      description = "Jump to previous diagnostic.",
    },
    {
      mode = { "n" },
      lhs = "]d",
      rhs = ":Lspsaga diagnostic_jump_next<CR>",
      options = opts,
      description = "Jump to next diagnostic.",
    },
  })

  local _ = pcall(require, vim.lsp.codelens.refresh)
end

config["on_attach"] = on_attach()

jdtls.start_or_attach(config)
