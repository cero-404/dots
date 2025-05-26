-- Keymap to open TODOs with Telescope
vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<CR>", {
  desc = "Search TODOs",
  noremap = true,
  silent = true
})
