return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local function show_macro_recording()
			local recording_register = vim.fn.reg_recording()
			if recording_register == "" then
				return ""
			else
				return "Recording @" .. recording_register
			end
		end

		require("lualine").setup({
			sections = {
				lualine_b = {
					{ "branch" },
					{
						"macro-recording",
						fmt = show_macro_recording,
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = "",
							readonly = "",
							unnamed = "",
							newfile = "[New]",
						},
					},
				},
				lualine_x = { "diagnostics", "lsp_status" },
			},
			options = {
				globalstatus = true,
				disabled_filetypes = {
					"NvimTree",
				},
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			},
		})
	end,
}
