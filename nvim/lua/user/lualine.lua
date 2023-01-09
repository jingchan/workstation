local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = { error = ' ', warn = ' ' },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  'diff',
  colored = false,
  symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
  cond = hide_in_width,
}

local mode = {
  'mode',
  fmt = function(str)
    return '[' .. string.sub(str, 0, 1) .. ']'
    -- return strsub(str, 0, 1)
  end,
}

local filetype = {
  'filetype',
  icons_enabled = false,
  icon = nil,
}

local branch = {
  'branch',
  icons_enabled = true,
  icon = '',
}

local location = {
  'location',
  padding = 0,
}

local ordinal_location = function()
  -- return '%l:%c'
  -- return '%p%%/%L'
  return '%l/%L:%02c'
end

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line('.') - 1
  local total_lines = vim.fn.line('$')
  local chars = {
    '  ',
    '__',
    '▁▁',
    '▂▂',
    '▃▃',
    '▄▄',
    '▅▅',
    '▆▆',
    '▇▇',
    '██',
  }
  local line_ratio = 1 - current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

local line_column = function()
  return '%l:%c'
end

local time = function()
  local date = os.date('*t')
  local ampm = date.hour < 12 and 'am' or 'pm'
  return string.format(
    '%d:%02d:%02d%s',
    date.hour / 2,
    date.min,
    date.sec,
    ampm
  )
end
-- require("auto-session-library").current_session_name
--
lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { branch, diagnostics },
    lualine_b = { mode },
    -- lualine_c = {
    --   'filename',
    --   -- require('auto-session-library').current_session_name,
    -- },
    -- lualine_c = { "encoding", "fileformat", "filetype" },
    -- lualine_x = { diff, 'location', 'encoding', filetype },
    lualine_x = { diff, filetype },
    lualine_y = { ordinal_location, progress },
    lualine_z = { time },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})

return lualine
