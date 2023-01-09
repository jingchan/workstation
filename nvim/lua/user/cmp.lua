local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end

-- local snip_status_ok, copilot_cmp = pcall(require, 'copilot_cmp')
-- if not snip_status_ok then
--   return
-- end

require('luasnip/loaders/from_vscode').lazy_load()

local check_backspace = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

-- vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = '',
  Method = 'm',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
  Copilot = '',
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api
        .nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]
        :match('^%s*$')
      == nil
end

-- Binding that accepts the current suggestion.
local confirm_suggestion = cmp.mapping.confirm({
  behavior = cmp.ConfirmBehavior.Replace,
  select = true,
})

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- documentation = {
    --   border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    -- },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-3),
    ['<C-f>'] = cmp.mapping.scroll_docs(3),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),

    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    -- Accept currently selected item. Set `select` to `false` to only confirm
    -- explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({
      -- this is the important line
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<Tab>'] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        confirm_suggestion()
        -- cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),

    -- This receives the "cmd-/" keybinding from iTerm.
    -- Not intended to be used directly.
    ['<C-k><C-e>'] = cmp.mapping.complete(),
  }),
  -- ['<Tab>'] = cmp.mapping(function(fallback)
  --   -- local copilot_keys = vim.fn['copilot#Accept']()
  --   if cmp.visible() then
  --     cmp.select_next_item()
  --     -- elseif copilot_keys ~= '' then
  --     -- vim.api.nvim_feedkeys(copilot_keys, 'i', true)
  --   elseif luasnip.expandable() then
  --     luasnip.expand()
  --   elseif luasnip.expand_or_jumpable() then
  --     luasnip.expand_or_jump()
  --   elseif check_backspace() then
  --     fallback()
  --   else
  --     fallback()
  --   end
  -- end, {
  --   'i',
  --   's',
  -- }),
  --}),
  -- mapping = {
  --   ['<C-g>'] = cmp.mapping(function(fallback)
  --     vim.api.nvim_feedkeys(
  --       vim.fn['copilot#Accept'](
  --         vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
  --       ),
  --       'n',
  --       true
  --     )
  --   end),
  --   ['<C-k>'] = cmp.mapping.select_prev_item(),
  --   ['<C-j>'] = cmp.mapping.select_next_item(),
  --
  --   ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-3), { 'i', 'c' }),
  --   ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(3), { 'i', 'c' }),
  --   ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  --   ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  --   ['<C-e>'] = cmp.mapping({
  --     i = cmp.mapping.abort(),
  --     c = cmp.mapping.close(),
  --   }),
  --   -- Custom for iTerm2 (for cmd key remaps)
  --   ['<C-i>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  --
  --   -- Accept currently selected item. If none selected, `select` first item.
  --   -- Set `select` to `false` to only confirm explicitly selected items.
  --   ['<CR>'] = cmp.mapping.confirm({ select = true }),
  --   ['<Tab>'] = cmp.mapping(function(fallback)
  --     local copilot_keys = vim.fn['copilot#Accept']()
  --     if cmp.visible() then
  --       cmp.select_next_item()
  --     elseif luasnip.expandable() then
  --       luasnip.expand()
  --     elseif luasnip.expand_or_jumpable() then
  --       luasnip.expand_or_jump()
  --     elseif check_backspace() then
  --       fallback()
  --     -- elseif copilot_keys ~= '' then
  --     --   vim.api.nvim_feedkeys(copilot_keys, 'i', true)
  --     else
  --       fallback()
  --     end
  --   end, {
  --     'i',
  --     's',
  --   }),
  --   ['<S-Tab>'] = cmp.mapping(function(fallback)
  --     if cmp.visible() then
  --       cmp.select_prev_item()
  --     elseif luasnip.jumpable(-1) then
  --       luasnip.jump(-1)
  --     else
  --       fallback()
  --     end
  --   end, {
  --     'i',
  --     's',
  --   }),
  -- },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
      -- -- This concatonates the icons with the name of the item kind
      -- vim_item.kind =
      --   string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        luasnip = '[Snip]',
        buffer = '[Buf]',
        path = '[Path]',
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    {
      name = 'copilot',
      max_item_count = 3,
      trigger_characters = {
        {
          '.',
          ':',
          '(',
          '\'',
          '"',
          '[',
          ',',
          '#',
          '*',
          '@',
          '|',
          '=',
          '-',
          '{',
          '/',
          '\\',
          '+',
          '?',
          ' ',
          -- "\t",
          -- "\n",
        },
      },
      group_index = 2,
    },
    -- {
    --   name = 'copilot',
    --   -- keyword_length = 0,
    --   max_item_count = 5,
    --   trigger_characters = {
    --     {
    --       '.',
    --       ':',
    --       '(',
    --       '\'',
    --       '"',
    --       '[',
    --       ',',
    --       '#',
    --       '*',
    --       '@',
    --       '|',
    --       '=',
    --       '-',
    --       '{',
    --       '/',
    --       '\\',
    --       '+',
    --       '?',
    --       ' ',
    --       -- "\t",
    --       -- "\n",
    --     },
    --   },
    --   group_index = 2,
    -- },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },

  -- sorting = {
  --   priority_weight = 2,
  --   comparators = {
  --     require('copilot_cmp').comparators.prioritize,
  --     require('copilot_cmp').comparators.score,

  --     -- Below is the default comparitor list and order for nvim-cmp
  --     cmp.config.compare.offset,
  --     -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
  --     cmp.config.compare.exact,
  --     cmp.config.compare.score,
  --     cmp.config.compare.recently_used,
  --     cmp.config.compare.locality,
  --     cmp.config.compare.kind,
  --     cmp.config.compare.sort_text,
  --     cmp.config.compare.length,
  --     cmp.config.compare.order,
  --   },
  -- },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  }),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
