local schemastore = require("schemastore")

local schemas = schemastore.yaml.schemas()

return {
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = schemas,
    },
  },
}
