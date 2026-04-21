require("blink.cmp").setup({
  keymap = { preset = "default" },
  appearance = { use_nvim_cmp_as_default = true },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
})
