require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "javascript", "typescript" },
	highlight = {
		enable = true,
	},
})
