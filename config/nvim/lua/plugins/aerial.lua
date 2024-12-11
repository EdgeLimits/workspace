return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local aerial = require("aerial")

		aerial.setup({

			vim.api.nvim_set_keymap("n", "<Leader>fa", ":AerialToggle<CR>", { noremap = true, silent = true }),
		})
	end,
}
