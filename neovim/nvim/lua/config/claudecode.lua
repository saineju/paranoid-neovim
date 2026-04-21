require("claudecode").setup({
  -- WebSocket server port range (auto-selects a free port)
  port_range = { min = 10000, max = 65535 },

  -- Auto-start the WebSocket server when Neovim opens
  auto_start = true,

  -- Terminal provider — "snacks" or "native"
  terminal = {
    provider = "snacks",
    auto_close = true,
  },

  -- Show a diff view when Claude modifies files (like VSCode's inline diff)
  diff = {
    provider = "native",  -- uses Neovim's built-in diff; or "mini_diff" if you add mini.diff
  },
})
