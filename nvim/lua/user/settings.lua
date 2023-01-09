local options = {

  -- Backup settings
  backup = true, -- creates a backup file
  backupdir = vim.fn.expand('~/.cache/nvim/backup'),
  backupskip = vim.fn.expand('~/.cache/*'),
  directory = vim.fn.expand('~/.cache/nvim/swap'),
  undodir = vim.fn.expand('~/.cache/nvim/undo'),
  undofile = false, -- enable persistent undo
  -- swapfile = false, -- creates a swapfile
  -- writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

  clipboard = 'unnamedplus', -- allows neovim to access the system clipboard

  -- UX Spacing
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  cmdheight = 3, -- more space in the neovim command line for displaying messages
  -- pumheight = 10, -- pop up menu height
  pumwidth = 30, -- pop up menu height

  completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp
  conceallevel = 1, -- so that `` is visible in markdown files
  fileencoding = 'utf-8', -- the encoding written to a file

  -- Searching
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- smart case

  -- Tabs
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  showtabline = 2, -- always show tabs

  mouse = 'a', -- allow the mouse to be used in neovim

  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  termguicolors = true, -- set term gui colors (most terminals support this)

  timeoutlen = 250, -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 250, -- faster completion (4000ms default)

  cursorline = true, -- highlight the current line

  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines

  numberwidth = 2, -- set number column width to 2 {default 4}
  signcolumn = 'yes', -- always show the sign column, otherwise it would shift the text each time

  wrap = true, -- display lines as one long line
  linebreak = true, -- companion to wrap, don't split words
  textwidth = 80,

  scrolloff = 10, -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 10, -- minimal number of screen columns either side of cursor if wrap is `false`
  guifont = 'monospace:h17', -- the font used in graphical neovim applications
  -- whichwrap = 'bs<>[]', -- which "horizontal" keys are allowed to travel to prev/next line

  colorcolumn = '81',
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

--vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append('c') -- don't give |ins-completion-menu| messages
-- vim.opt.iskeyword:append('-') -- hyphenated words recognized by searches

-- don't insert the current comment leader automatically for auto-wrapping
-- comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or
-- what
-- 'O' in normal mode.
--vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.formatoptions:append('t')
vim.opt.formatoptions:append('c')
vim.opt.formatoptions:append('j')
vim.opt.formatoptions:append('r')
vim.opt.formatoptions:append('q')
vim.opt.formatoptions:append('b')
vim.opt.formatoptions:append('l')
vim.opt.formatoptions:append('o')
vim.opt.formatoptions:append('/')
-- 'c', 'j', 'r', 'q', 'b', 'l', 'o', '/' })

vim.opt.runtimepath:remove('/usr/share/vim/vimfiles') -- separate vim plugins from neovim in case vim still in use

-- Show quick flash of color when yanking
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=100}
  augroup END
]])

--- Session management
-- vim.g.session_autosave = "yes"
-- vim.g.session_autoload = "yes"
-- vim.g.session_default_to_last = "yes"
-- vim.opt.sessionoptions:remove({ "buffers" })
