vim.cmd.colorscheme("catppuccin-mocha")

require("lualine").setup({
  options = {
    theme = "catppuccin",
    component_separators = "|",
    section_separators = "",
  },
})

require("which-key").setup()
require("mini.pairs").setup()
