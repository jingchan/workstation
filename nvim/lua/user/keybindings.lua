local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Use \ as leader key.
--vim.g.mapleader = "\\"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)
-- keymap('n', '`h', '<C-w>h', opts)
-- keymap('n', '`j', '<C-w>j', opts)
-- keymap('n', '`k', '<C-w>k', opts)
-- keymap('n', '`l', '<C-w>l', opts)

-- Resize with arrows
keymap('n', '<A-k>', ':resize -2<CR>', opts)
keymap('n', '<A-j>', ':resize +2<CR>', opts)
keymap('n', '<A-h>', ':vertical resize -2<CR>', opts)
keymap('n', '<A-l>', ':vertical resize +2<CR>', opts)
keymap('n', '<C-Up>', ':resize -2<CR>', opts)
keymap('n', '<C-Down>', ':resize +2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Buffer navigation
-- keymap('n', 'gt', ':bnext<CR>', opts)
-- keymap('n', 'gT', ':bprevious<CR>', opts)
-- keymap('n', '<S-l>', ':bnext<CR>', opts)
-- keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap('i', 'jj', '<ESC>', opts)
keymap('i', 'kk', '<ESC>', opts)
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('x', 'J', ':move \'>+1<CR>gv-gv', opts)
keymap('x', 'K', ':move \'<-2<CR>gv-gv', opts)
--keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
--keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
--keymap("v", "<A-j>", ":m .+1<CR>==", opts)
--keymap("v", "<A-k>", ":m .-2<CR>==", opts)
--keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
--keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap('t', '`h', '<C-\\><C-N><C-w>h', term_opts)
-- keymap('t', '`j', '<C-\\><C-N><C-w>j', term_opts)
-- keymap('t', '`k', '<C-\\><C-N><C-w>k', term_opts)
-- keymap('t', '`l', '<C-\\><C-N><C-w>l', term_opts)

-- keymap('', '`', '<Nop>', opts)

-- Don't put single character delete into register.
keymap('n', 'x', '"_x', opts)

-- Sort and dedupe current paragraph by line
vim.keymap.set('n', '<leader>s', 'vip:sort u<CR>')

-- Convenience bindings for editing configuration files.
local function reload_config()
  vim.cmd('source ' .. vim.env.MYVIMRC)
  print('Reloading configs...')
end

-- if current file is not read-only or an empty buffer, write item
local function write_to_disk_and_reload_as_config()
  if vim.bo.readonly == false and vim.fn.empty(vim.fn.expand('%')) == 0 then
    vim.cmd('write')
  end

  -- Run the current file if it has a lua file extension
  if vim.fn.expand('%:e') == 'lua' then
    vim.cmd('luafile %')
  end

  reload_config()
end

-- Quickly edit/reload this configuration file
vim.keymap.set('n', '<leader>ve', function()
  if vim.env.MYVIMRC then
    vim.cmd('edit ' .. vim.env.MYVIMRC)
  else
    vim.cmd('edit ' .. vim.fn.stdpath('config') .. '/init.lua')
  end
end, { noremap = true })

-- Write current file and reload settings.
vim.keymap.set(
  'n',
  '<leader>vr',
  write_to_disk_and_reload_as_config,
  { noremap = true }
)

-- Open vim packer plugin download directory.
vim.keymap.set('n', '<leader>vp', function()
  vim.cmd('edit ' .. vim.fn.stdpath('data') .. '/site/pack/packer/start')
end, { noremap = true })
