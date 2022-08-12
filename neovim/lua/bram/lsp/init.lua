local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("bram.lsp.lsp-installer")
require("bram.lsp.handlers").setup()

local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/Cellar/llvm/14.0.6_1/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.rust = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}
