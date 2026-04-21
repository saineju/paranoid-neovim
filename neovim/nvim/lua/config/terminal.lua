require("toggleterm").setup({
  size = 15,
  open_mapping = [[<C-\>]],  -- Ctrl+\ toggles terminal, same as VSCode
  direction = "horizontal",
  shade_terminals = false,
})
-- Escape from terminal mode with Esc
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
