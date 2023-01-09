local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_cmp_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(
      sign.name,
      { texthl = sign.name, text = sign.text, numhl = '' }
    )
  end

  local config = {
    virtual_text = true,
    signs = {
      active = signs, -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/hover'] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = 'rounded',
    })

  vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = 'rounded',
    })
end

local function lsp_keymaps(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  local map_key = vim.keymap.set

  -- Core LSP keymaps
  map_key('n', '<space>e', vim.diagnostic.open_float, bufopts)
  map_key('n', '<space>s', vim.lsp.buf.signature_help, bufopts)
  map_key('n', '[d', vim.diagnostic.goto_prev, bufopts)
  map_key('n', ']d', vim.diagnostic.goto_next, bufopts)
  map_key('n', '\\[', vim.diagnostic.goto_prev, bufopts)
  map_key('n', '\\]', vim.diagnostic.goto_next, bufopts)
  map_key('n', '<space>q', vim.diagnostic.setloclist, bufopts)
  map_key('n', '<space>f', function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
  map_key('n', 'gl', vim.diagnostic.open_float, bufopts)

  -- Additional LSP keymaps
  map_key('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map_key('n', 'gd', vim.lsp.buf.definition, bufopts)
  map_key('n', 'K', vim.lsp.buf.hover, bufopts)
  map_key('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map_key('n', 'gr', vim.lsp.buf.references, bufopts)
  map_key('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  map_key('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  map_key('n', '<space>D', vim.lsp.buf.type_definition, bufopts)

  -- Custom for iTerm2 (for cmd key remaps)
  map_key('n', '<C-k><C-l>', vim.lsp.buf.hover, bufopts)
  map_key('n', '<C-k><C-i>', vim.diagnostic.open_float, bufopts)
  -- map_key('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- map_key('n', '<C-k><C-l>', vim.diagnostic.open_float, bufopts)
  -- map_key('n', '<C-k><C-i>', vim.lsp.buf.hover, bufopts)

  -- keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  -- keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
  -- keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", okts)
  -- keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
  -- keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  -- keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  -- keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  -- keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  -- keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

  -- keymap(bufnr, "n", "<C-i>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  if client.name == 'tsserver' then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.name == 'sumneko_lua' then
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.name == 'rust_analyzer' then
    client.server_capabilities.documentFormattingProvider = true
  end

  if client.name == 'taplo' then
    client.server_capabilities.documentFormattingProvider = true
  end

  -- local status_ok, rt = pcall(require, "rust-tools")
  -- if not status_ok then
  --   return
  -- end
  -- rt.setup({
  --   server = {
  --     on_attach=function(_, bufnr)
  --
  --     end,
  --   }
  -- })

  lsp_keymaps(bufnr)
  local status_ok, illuminate = pcall(require, 'illuminate')
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

return M
