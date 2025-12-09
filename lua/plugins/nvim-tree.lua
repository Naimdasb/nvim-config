return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 45,
			},
			renderer = {
				group_empty = true,
				root_folder_label = false,
				indent_markers = { enable = true },
			},
			filters = { custom = { "^\\.git" } },
		})

		vim.keymap.set("n", "<Leader>tf", ":NvimTreeFindFile<cr>")
		vim.keymap.set("n", "<Leader>tt", ":NvimTreeToggle<cr> zz")
	end,
}
