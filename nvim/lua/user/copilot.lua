local status_ok, copilot = pcall(require, 'copilot')
if not status_ok then
  return
end

copilot.setup({
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = '[[',
      jump_next = ']]',
      accept = '<CR>',
      refresh = 'gr',
      open = '<M-CR>',
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 50,
    -- debounce = 75,
    keymap = {
      accept = '<M-l>',
      -- accept = '<TAB>',
      accept_word = false,
      accept_line = false,
      -- next = '<C-]>',
      -- prev = '<C-[>',
      next = '<M-]>',
      prev = '<M-[>',
      dismiss = '<C-]>',
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ['.'] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
})

-- local opts = { noremap = true, silent = true }
-- vim.g.copilot_no_tab_map = true
--
-- -- Ask Copilot to make a suggestion, also mapped to cmd+k, cmd+u from iTerm.
-- vim.keymap.set('n', '<C-k><C-u>', 'i<Plug>(copilot-suggest)', opts)
-- vim.keymap.set('i', '<C-k><C-u>', '<Plug>(copilot-suggest)', opts)
-- vim.keymap.set('i', '<C-k><C-n>', '<Plug>(copilot-next)', opts)
-- vim.keymap.set('i', '<C-k><C-p>', '<Plug>(copilot-prev)', opts)
