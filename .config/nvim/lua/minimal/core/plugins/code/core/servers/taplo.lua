local schemastore = require("schemastore")

local schemas = schemastore.toml.schemas()

return {
  settings = {
    toml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = schemas,
    },
  },
}
