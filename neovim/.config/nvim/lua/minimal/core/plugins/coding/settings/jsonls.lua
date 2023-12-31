local schemastore = require("schemastore")

local schemas = schemastore.json.schemas()

return {
  flags = {
    debounce_text_changes = 500,
  },
  settings = {
    json = {
      schemas = schemas,
      validate = {
        enable = true,
      },
    },
  },
}
