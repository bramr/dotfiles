local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("bram.lsp.lsp-installer")
require("bram.lsp.handlers").setup()
