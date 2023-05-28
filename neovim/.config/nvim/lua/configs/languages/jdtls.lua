---@diagnostic disable: need-check-nil
local api = require("utils.api")
local settings = require("core.settings")
local lsp_config = require("utils.plugins.nvim-lspconfig")

local M = {
  requires = {
    "jdtls",
    "jdtls.setup",
  },
  root_markers = {
    ".git",
    "mvnw",
    "gradlew",
    "pom.xml",
    "build.gradle",
  },
  jdtls_path = api.paths.join(settings.mason_install_directory, "packages", "jdtls"),
}

function M.before()
  M.setup_workspace()
end

function M.load()
  M.jdtls.start_on_attach = {
    cmd = {
      "/usr/bin/java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-javaagent:" .. M.jdtls_path .. "/lombok.jar",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens",
      "java.base/java.util=ALL-UNNAMED",
      "--add-opens",
      "java.base/java.lang=ALL-UNNAMED",

      "-jar",
      vim.fn.glob(M.jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
      "-configuration",
      M.jdtls_path .. "/config_linux",
      "-data",
      M.workspace_dir,
    },

    root_dir = M.jdtls_setup.find_root(M.root_markers),
    capabilities = lsp_config.get_capabilities(),

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

    extendedClientCapabilities = M.jdtls.extendedClientCapabilities,

    flags = {
      allow_incremental_sync = true,
    },
    init_options = {
      bundles = {},
    },
  }
end

function M.after() end

function M.setup_workspace()
  M.project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  M.workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. M.project_name

  local function directory_exists(path)
    local f = io.popen("cd " .. path)
    local ff = f:read("*all")

    if ff:find("ItemNotFoundException") then
      return false
    else
      return true
    end
  end

  if directory_exists(M.workspace_dir) then
  else
    os.execute("mkdir " .. M.workspace_dir)
  end
end

return M
