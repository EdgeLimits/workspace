return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	config = function()
		local tree = require("nvim-tree")
		tree.setup({ -- Configuration options go here
			view = {
				side = "right", -- Place the file explorer on the right side
				width = 30, -- Adjust the width as needed
			},
			-- Key mapping for toggling nvim-tree with <Leader>e
			vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true }),
		})
	end,
}
