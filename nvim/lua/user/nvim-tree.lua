local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
  -- open_on_setup = true,
  -- ignore_buffer_on_setup = true,

  -- Customize configs
  disable_netrw = true,
  hijack_netrw = true,

  -- Place cursor at beginning of filename.
  hijack_cursor = true,

  ignore_ft_on_setup = {
    'gitcommit',
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    -- add_trailing = true,
    group_empty = true,
    root_folder_label = function(path)
      return vim.fn.fnamemodify(path, ':t') .. '/'
    end,
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        folder = {
          arrow_open = '',
          arrow_closed = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          unstaged = '',
          staged = 'S',
          unmerged = '',
          renamed = '➜',
          untracked = 'U',
          deleted = '',
          ignored = '◌',
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  view = {
    width = 30,
    side = 'left',
    number = true,
    relativenumber = true,
    mappings = {
      list = {
        { key = { 'l', '<CR>', 'o' }, cb = tree_cb('edit') },
        { key = 'h', cb = tree_cb('close_node') },
        { key = 'v', cb = tree_cb('vsplit') },
      },
    },
  },
  actions = {
    change_dir = {
      restrict_above_cwd = true,
    },
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})

-- Set keymap for toggling nvim-tree
vim.keymap.set({ 'n' }, '<C-n>', function()
  -- Toggle without finding file but do add focus.
  nvim_tree.toggle(false, true)
end, { noremap = true, silent = true })

return nvim_tree
