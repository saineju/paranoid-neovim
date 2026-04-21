require("nvim-tree").setup({
  view = { width = 30 },
  renderer = { group_empty = true },
  filters = { dotfiles = false },
})
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File explorer" })
