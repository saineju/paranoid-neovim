-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Completion
  { "saghen/blink.cmp", version = "1.*", event = "InsertEnter" },

  -- Formatting
  { "stevearc/conform.nvim", event = { "BufWritePre" } },

  -- Fuzzy finder
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = { "<leader>ff", "<leader>fg", "<leader>fb" },
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Git
  { "tpope/vim-fugitive", cmd = "Git" },
  { "lewis6991/gitsigns.nvim", event = "BufRead" },

  -- Terminal
  { "akinsho/toggleterm.nvim", version = "*", keys = "<C-\\>" },

  -- UI
  { "nvim-lualine/lualine.nvim", event = "VeryLazy" },
  { "folke/which-key.nvim", event = "VeryLazy" },
  { "echasnovski/mini.pairs", event = "InsertEnter" },

  -- Colorscheme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = false },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },  -- optional, for nicer terminal UI
    opts = {
      terminal = {
        provider = "snacks",
      },
    },
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>",           desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",      desc = "Focus Claude" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>",       desc = "Send to Claude",  mode = "v" },
      { "<leader>ar", "<cmd>ClaudeCodeDiffReject<cr>", desc = "Reject diff" },
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    }
  }
},
{
  -- Keep lockfile at the root of your config for reproducibility
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
})

require("config.options")
require("config.keymaps")
require("config.lsp")
require("config.completion")
require("config.telescope")
require("config.nvimtree")
require("config.git")
require("config.terminal")
require("config.ui")
require("config.claudecode")
