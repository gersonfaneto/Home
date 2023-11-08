-- Source: https://github.com/hrsh7th/cmp-nvim-lsp/blob/main/lua/cmp_nvim_lsp/init.lua

local M = {}

local is_nil = function(override, default)
  if override == nil then
    return default
  end

  return override
end

M.default_capabilities = function(override)
  if override == nil then
    override = {}
  end

  return {
    textDocument = {
      completion = {
        dynamicRegistration = is_nil(override.dynamicRegistration, false),
        completionItem = {
          snippetSupport = is_nil(override.snippetSupport, true),
          commitCharactersSupport = is_nil(override.commitCharactersSupport, true),
          deprecatedSupport = is_nil(override.deprecatedSupport, true),
          preselectSupport = is_nil(override.preselectSupport, true),
          tagSupport = is_nil(override.tagSupport, {
            valueSet = {
              1, -- Deprecated
            },
          }),
          insertReplaceSupport = is_nil(override.insertReplaceSupport, true),
          resolveSupport = is_nil(override.resolveSupport, {
            properties = {
              "documentation",
              "detail",
              "additionalTextEdits",
              "sortText",
              "filterText",
              "insertText",
              "textEdit",
              "insertTextFormat",
              "insertTextMode",
            },
          }),
          insertTextModeSupport = is_nil(override.insertTextModeSupport, {
            valueSet = {
              1, -- asIs
              2, -- adjustIndentation
            },
          }),
          labelDetailsSupport = is_nil(override.labelDetailsSupport, true),
        },
        contextSupport = is_nil(override.snippetSupport, true),
        insertTextMode = is_nil(override.insertTextMode, 1),
        completionList = is_nil(override.completionList, {
          itemDefaults = {
            "commitCharacters",
            "editRange",
            "insertTextFormat",
            "insertTextMode",
            "data",
          },
        }),
      },
    },
  }
end

return M
