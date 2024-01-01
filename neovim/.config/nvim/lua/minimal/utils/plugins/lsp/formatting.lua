local types = require("minimal.utils.types")

local notify = require("lazy.core.util")

local M = {}

M.format_on_save = types.settings.format_on_save

function M.toggle()
  if types.settings.format_on_save == false then
    M.format_on_save = false
  else
    M.format_on_save = not M.format_on_save
  end

  if M.format_on_save then
    notify.info("Enabled format on save.", { title = "Format" })
  else
    notify.warn("Disabled format on save.", { title = "Format" })
  end
end

function M.format(opts)
  if vim.b.autoformat == false and not (opts and opts.force) then
    return
  end

  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[bufnr].filetype
  local have_support = package.loaded["null-ls"]
      and (#require("null-ls.sources").get_available(filetype, "NULL_LS_FORMATTING") > 0)

  vim.lsp.buf.format(vim.tbl_deep_extend("force", {
    bufnr = bufnr,
    filter = function(client)
      if have_support then
        return client.name == "null-ls"
      end
      return client.name ~= "null-ls"
    end,
  }, {}))
end

function M.on_attach(client, bufnr)
  if
      client.config
      and client.config.capabilities
      and client.config.capabilities.documentFormattingProvider == false
  then
    return
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, {}),
    buffer = bufnr,
    callback = function()
      if M.format_on_save then
        M.format()
      end
    end,
  })
end

return M
