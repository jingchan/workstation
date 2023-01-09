-- Auto-Session
--
-- Note: Alternative: neovim-session-manager (Seems buggy)
local status_ok, auto_session = pcall(require, 'auto-session')
if not status_ok then
  return
end

auto_session.setup({
  log_level = 'error',
  auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },

  post_cwd_changed_hook = function()
    -- require('lualine').refresh()
  end,
})

-- Recommended sessionoptions config from auto-session README.md.
vim.o.sessionoptions =
  'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
