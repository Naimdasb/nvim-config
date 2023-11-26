return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("preservim/nerdtree")
	use("ryanoasis/vim-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("MunifTanjim/eslint.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("mhartington/formatter.nvim")

	require("null-ls").setup()
	require("mason").setup()
	require("mason-lspconfig").setup()

	require("config.options")
	require("config.telescope")
	require("config.formatter")
	require("config.treesitter")
	require("config.linter")
	require("config.lualine")
	require("config.autocomplete")
	require("config.lsp")
end)
