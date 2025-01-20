return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
			local setup, nvimtree = pcall(require, "nvim-tree")
			if not setup then
				return
			end

			-- recomended settings from nvim-tree documentation
			--
			vim.g.loaded = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true

			vim.cmd([[highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

			nvimtree.setup({
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true,
				},
				-- change folder arrow icons
				renderer = {
					icons = {
						glyphs = {
							folder = {
								arrow_closed = "", -- arrow when folder is closed
								arrow_open = "", -- arrow when folder is open
							},
						},
					},
				},
				-- disable window_picker for
				-- explorer to work well with
				-- window splits
				actions = {
					open_file = {
						window_picker = {
							enable = false,
						},
					},
				},
			})
		end,
	},
}
