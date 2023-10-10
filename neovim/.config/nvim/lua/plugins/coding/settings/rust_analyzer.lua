return {
  settings = {
    ["rust-analyzer"] = {
      lens = {
        enable = true,
      },
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        runBuildScripts = true,
      },
      check = {
        enable = true,
        allFeatures = true,
        command = "clippy",
        extraArgs = { "--no-deps" },
      },
      procMacro = {
        enable = true,
        ignored = {
          ["napi-derive"] = { "napi" },
          ["async-trait"] = { "async_trait" },
          ["async-recursion"] = { "async_recursion" },
        },
      },
    },
  },
}
