-- lspconfig setup for pyright
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.pyright.setup({
  capabilities = capabilities,
})
