return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "ts_ls", "eslint" } })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"saghen/blink.cmp"
		},
		config = function()
			local capabilities = require('blink.cmp').get_lsp_capabilities()

			local on_attach = function(ev)
				vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
				vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, {})
				vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, {})
				vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
				vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename, {})
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = ev.buf })
			end

			vim.diagnostic.config({ virtual_text = true })

			vim.lsp.config("ts_ls", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.lsp.enable("ts_ls")

			vim.lsp.config("eslint", {
				on_attach = function(_, bfnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bfnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end,
			})

			vim.lsp.enable("eslint")

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						format = {
							enable = true,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
							}
						},
					},
				},
				on_attach = function(ev, bfnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bfnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})

					on_attach(ev)
				end,
				capabilities = capabilities,
			})

			vim.lsp.enable("lua_ls")
		end,
	},
}
