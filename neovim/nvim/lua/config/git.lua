require("gitsigns").setup({
  signs = {
    add          = { text = "▎" },
    change       = { text = "▎" },
    delete       = { text = "󰍵" },
    untracked    = { text = "▎" },
  },
  current_line_blame = true,
})
vim.keymap.set("n", "<leader>gs", "<cmd>Git<cr>",        { desc = "Git status" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>",  { desc = "Git blame" })
