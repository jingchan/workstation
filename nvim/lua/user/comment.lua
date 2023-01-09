local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
  return
end

comment.setup({
  pre_hook = function(ctx)
    local U = require('Comment.utils')

    local status_utils_ok, utils =
      pcall(require, 'ts_context_commentstring.utils')
    if not status_utils_ok then
      return
    end

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = utils.get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = utils.get_visual_start_location()
    end

    local status_internals_ok, internals =
      pcall(require, 'ts_context_commentstring.internals')
    if not status_internals_ok then
      return
    end

    return internals.calculate_commentstring({
      key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
      location = location,
    })
  end,
})

-- These receive the "cmd-/" keybinding from iTerm.
-- Not intended to be used directly.
vim.keymap.set(
  { 'n', 'o' },
  '<C-k><C-g>',
  '<Plug>(comment_toggle_linewise_current)',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'x',
  '<C-k><C-g>',
  '<Plug>(comment_toggle_linewise_visual)gv',
  { noremap = true, silent = true }
)
vim.keymap.set(
  'i',
  '<C-k><C-g>',
  '<esc><Plug>(comment_toggle_linewise_current)A',
  { noremap = true, silent = true }
)
