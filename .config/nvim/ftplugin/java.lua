local hadSuccessI, JDTLS = pcall(require, "jdtls")
local hadSuccessII, JDTLSSetup = pcall(require, "jdtls.setup")

if not (hadSuccessI or hadSuccessII) then
  return
end

local currentSystem
if vim.fn.has("macunix") then
  currentSystem = "mac"
elseif vim.fn.has("win32") then
  currentSystem = "win"
else
  currentSystem = "linux"
end

local defaultCapabilities = vim.lsp.protocol.make_client_capabilities()
defaultCapabilities.textDocument.completion.completionItem.snippetSupport = true
defaultCapabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

local extendedClientCapabilities = JDTLS.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local JDTLSPath = vim.fn.stdpath("data") .. "/mason/packages/jdtls/"
local LSPServerPath = JDTLSPath .. "config_" .. currentSystem
local PluginsPath = JDTLSPath .. "plugins/"
local JarPath = PluginsPath .. "org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local LombokPath = JDTLSPath .. "lombok.jar"

local RootMarkers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local RootDir = JDTLSSetup.find_root(RootMarkers)
if RootDir == "" then
  return
end

local ProjectName = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local Workspaces = vim.fn.stdpath("data") .. "/site/java/workspace-root/"
local WorkspaceDir = Workspaces .. ProjectName
if vim.fn.finddir(ProjectName, Workspaces) == "" then
  os.execute("mkdir " .. WorkspaceDir)
end

local JDTLSConfig = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-javaagent:" .. LombokPath,
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    JarPath,
    "-configuration",
    LSPServerPath,
    "-data",
    WorkspaceDir,
  },
  capabilities = defaultCapabilities,
  root_dir = RootDir,
  settings = {
    java = {},
  },
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = {},
  },
}

JDTLSConfig["on_attach"] = function(_, bufnr)
  local _, _ = pcall(vim.lsp.codelens.refresh)
  require("PluginsSettings.KeyBindings").JavaKeys(bufnr)
end

JDTLS.start_or_attach(JDTLSConfig)
