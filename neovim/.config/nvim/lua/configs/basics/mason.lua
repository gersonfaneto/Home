local options = require("core.options")

local M = {
  requires = {
    "mason",
    "mason-registry",
  },
}

function M.before()
  M.installer_tools = {
    lsp = {
      "gopls",
      "jdtls",
      "cmake",
      "clangd",
      "pyright",
      "css-lsp",
      "json-lsp",
      "html-lsp",
      "emmet-ls",
      "vetur-vls",
      "rust-analyzer",
      "vim-language-server",
      "lua-language-server",
      "bash-language-server",
      "typescript-language-server",
      "tailwindcss-language-server",
    },
    dap = {},
    linter = {},
    formatter = {},
  }
end

function M.load()
  M.mason.setup({
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
      border = options.float_border and "double" or "none",
    },
    install_root_dir = options.mason_install_directory,
  })
end

function M.after()
  local installed_packages = {}

  for _, package_kind in pairs(M.installer_tools) do
    for _, package_name_version in pairs(package_kind) do
      ---@diagnostic disable-next-line: missing-parameter
      local name, version = unpack(vim.split(package_name_version, "@"))

      if not M.mason_registry.is_installed(name) then
        if not M.mason_registry.has_package(name) then
          vim.notify(("Invalid package name : %s"):format(name), "ERROR", { title = "Mason" })
        else
          local params = version and { version = version }
          M.mason_registry.get_package(name):install(params)
          table.insert(installed_packages, package_name_version)
        end
      end
    end
  end

  if not vim.tbl_isempty(installed_packages) then
    vim.notify(
      ("Start install package : \n - %s"):format(table.concat(installed_packages, "\n - ")),
      "INFO",
      { title = "Mason" }
    )
  end
end

return M
