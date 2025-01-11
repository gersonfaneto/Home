local harpoon = require('harpoon')

harpoon:setup()

vim.keymap.set('n', '<C-a>', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

for i = 1, 5, 1 do
  vim.keymap.set('n', string.format('<C-%d>', i), function()
    harpoon:list():select(i)
  end)
end

vim.keymap.set('n', '<C-S-P>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-S-N>', function()
  harpoon:list():next()
end)
