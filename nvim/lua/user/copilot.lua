local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
  return
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.copilot_no_tab_map = true

-- Set keybindings for Copilot
keymap("n", "<leader>cp", ":Copilot<CR>", opts)
keymap("v", "<leader>cp", ":Copilot<CR>", opts)
keymap("n", "<leader>ca", ":Copilot!<CR>", opts)
keymap("v", "<leader>ca", ":Copilot!<CR>", opts)
