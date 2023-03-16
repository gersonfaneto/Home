return function(targetMode, keyCombination, desiredOutput, optDescription, optBufnr)
  vim.keymap.set(targetMode, keyCombination, desiredOutput, {
    noremap = true,
    silent = true,
    desc = optDescription or "",
    buffer = optBufnr or nil,
  })
end
