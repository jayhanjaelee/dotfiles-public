local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "jay.lsp.mason"
require("jay.lsp.handlers").setup()
require "jay.lsp.null-ls"
require "jay.lsp.lspsaga"
