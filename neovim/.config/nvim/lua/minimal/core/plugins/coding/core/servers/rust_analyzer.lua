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
        extraArgs = {
          "--",
          "-W clippy::pedantic",
          "-W clippy::nursery",
          "-W clippy::unwrap_used",
          "-W clippy::expect_used",
        },
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
