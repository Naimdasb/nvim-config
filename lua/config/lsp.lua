require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
require("lspconfig").tsserver.setup({
	on_attach = function(_, _)
		vim.keymap.set("n", "<space>d", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<space>i", vim.lsp.buf.implementation, {})
		vim.keymap.set("n", "<space>h", vim.lsp.buf.hover, {})
	end,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
