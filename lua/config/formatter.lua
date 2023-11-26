require("formatter").setup({
	filetype = {
		javascript = { require("formatter.filetypes.javascript").prettier },
		javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
		lua = { require("formatter.filetypes.lua").stylua },
	},
})

vim.keymap.set("n", "<space>pp", "<cmd>Format<cr>", {})
