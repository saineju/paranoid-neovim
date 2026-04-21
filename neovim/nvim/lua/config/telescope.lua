local telescope = require("telescope")
telescope.setup({
  defaults = { file_ignore_patterns = { "node_modules", ".git/" } },
})
telescope.load_extension("fzf")

local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>",  { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",   { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",     { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",   { desc = "Help" })
