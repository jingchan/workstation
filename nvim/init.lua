-- Eagerly disable NetRW (preferring `nvim-tree`)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- Load plugins first
require('user.plugins')

require('user.settings')
require('user.keybindings')
require('user.colorscheme')
require('user.nvim-tree')

require('user.telescope')
require('user.navigator')
require('user.lsp')
require('user.comment')
require('user.copilot')
require('user.cmp')

require('user.alpha')
-- require('user.auto-session')
require('user.autocommands')
require('user.autopairs')
require('user.bufferline')
require('user.gitsigns')
require('user.indentline')
require('user.lualine')
require('user.project')
require('user.treesitter')
require('user.whichkey')
