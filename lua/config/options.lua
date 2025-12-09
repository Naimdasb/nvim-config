vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.number = true
vim.o.cmdheight = 0
vim.o.signcolumn = "yes"
vim.o.scrolloff = 16
vim.o.updatetime = 1000

vim.keymap.set("n", "<Leader>nh", ":nohlsearch<cr>")
vim.keymap.set("n", "n", "nzz")

vim.keymap.set("v", "<S-u>", ":m '<-2<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<S-d>", ":m '>+1<CR>gv=gv", { noremap = true })

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.lsp.buf.document_highlight()
	end,
})

vim.api.nvim_create_autocmd("CursorHoldI", {
	callback = function()
		vim.lsp.buf.document_highlight()
	end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
	callback = function()
		vim.lsp.buf.clear_references()
	end,
})
