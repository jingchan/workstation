local status_ok, navigator = pcall(require, 'Navigator')
if not status_ok then
  return
end

navigator.setup()

local opts = { noremap = true, silent = true }
-- vim.keymap.set('', '<C-h>', navigator.left, opts)
-- vim.keymap.set('', '<C-j>', navigator.down, opts)
-- vim.keymap.set('', '<C-k>', navigator.up, opts)
-- vim.keymap.set('', '<C-l>', navigator.right, opts)
vim.keymap.set('', '`h', navigator.left, opts)
vim.keymap.set('', '`j', navigator.down, opts)
vim.keymap.set('', '`k', navigator.up, opts)
vim.keymap.set('', '`l', navigator.right, opts)
vim.keymap.set('', '`\\', navigator.previous, opts)
