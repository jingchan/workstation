local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer close and reopen Neovim...')
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- Have packer manage itself
  use('wbthomason/packer.nvim')

  -- Useful lua functions used by lots of plugins
  use('nvim-lua/plenary.nvim')

  -- Autopairs, integrates with both cmp and treesitter
  use('windwp/nvim-autopairs')
  use('numToStr/Comment.nvim')

  use('JoosepAlviste/nvim-ts-context-commentstring')

  use({
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  })
  use('akinsho/bufferline.nvim')
  use('moll/vim-bbye')
  use('nvim-lualine/lualine.nvim')

  -- Don't need this since we use tmux
  -- use({
  --   'akinsho/toggleterm.nvim',
  --   commit = '2a787c426ef00cb3488c11b14f5dcf892bbd0bda',
  -- })
  use('ahmedkhalf/project.nvim')
  -- Adds guides for indent levels.
  use('lukas-reineke/indent-blankline.nvim')

  -- Disable Alpha for now, doens't seem that useful until we customize.
  -- use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }) -- Adds welcome screen.
  -- use('folke/which-key.nvim')

  -- Colorschemes
  use('folke/tokyonight.nvim')
  use('lunarvim/darkplus.nvim')

  -- Completion plugin.
  use({ 'hrsh7th/nvim-cmp', requires = {
    'zbirenbaum/copilot-cmp',
  } })

  -- ### Completion Sources

  -- Buffer completions.
  use('hrsh7th/cmp-buffer')
  -- Path completions.
  use('hrsh7th/cmp-path')
  -- Snippet completions.
  use('saadparwaiz1/cmp_luasnip')
  -- Source for built-in LSP server.
  use('hrsh7th/cmp-nvim-lsp')
  -- Displays function signature with current parameter emphasized.
  use('hrsh7th/cmp-nvim-lsp-signature-help')
  -- Completes the neovim runtime api (e.g. vim.lsp.*)
  use('hrsh7th/cmp-nvim-lua')
  -- Snippet Engine
  use('L3MON4D3/LuaSnip')
  -- A bunch of snippets to use.
  -- TODO: Do we even want or need this?
  -- use('rafamadriz/friendly-snippets')

  -- LSP - Basic configuration.
  use('neovim/nvim-lspconfig')
  -- Language server installer.
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  -- Formatting and linting
  use('jose-elias-alvarez/null-ls.nvim')
  use('RRethy/vim-illuminate')
  use('simrat39/rust-tools.nvim')

  -- Telescope
  use('nvim-telescope/telescope.nvim')

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter')

  -- Git
  use('lewis6991/gitsigns.nvim')

  -- use({
  --   "vimwiki/vimwiki",
  --   config = function()
  --     vim.g.vimwiki_list = {
  --       {
  --         path = "~/",
  --         syntax = "markdown",
  --         ext = ".md",
  --       },
  --     }
  --     vim.g.vimwiki_ext2syntax = {
  --       [".md"] = "markdown",
  --       [".markdown"] = "markdown",
  --       [".mdown"] = "markdown",
  --     }
  --   end,
  -- })

  -- Session Persistence
  -- use('rmagatti/auto-session')

  -- Copilot
  -- use('github/copilot.vim')
  use('zbirenbaum/copilot.lua')

  use({
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup({
        -- method = "getPanelCompletions",
        method = 'getCompletionsCycling',
        formatters = {
          label = require('copilot_cmp.format').format_label_text,
          insert_text = require('copilot_cmp.format').format_insert_text,
          preview = require('copilot_cmp.format').deindent,
        },
      })
    end,
  })
  -- use({
  --   'zbirenbaum/copilot.lua',
  --   event = 'VimEnter',
  --   config = function()
  --     vim.defer_fn(function()
  --       require('copilot').setup()
  --     end, 100)
  --   end,
  -- })

  use('ludovicchabant/vim-gutentags')

  -- Integration between Tmux and Vim.
  -- Embed vim status line into tmux.
  use('vimpostor/vim-tpipeline')
  -- Embed vim status line into tmux.
  use('numToStr/Navigator.nvim')
  -- use({ 'christoomey/vim-tmux-navigator' })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
