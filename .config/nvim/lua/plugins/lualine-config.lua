return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local setup, lualine = pcall(require, "lualine")
			if not setup then
				return
			end

			lualine.setup({
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function(str)
								return str:sub(1, 1)
							end,
						},
					},
					lualine_b = { "branch", "diagnostics" },
					lualine_c = { {
						"filename",
						path = 2,
					} },
					lualine_x = {
						{
							"filetype",
							colored = true, -- Displays filetype icon in color if set to true
							icon_only = true, -- Display only an icon for filetype
							icon = { align = "right" }, -- Display filetype icon on the right hand side
							-- icon =    {'X', align='right'}
							-- Icon string ^ in table is ignored in filetype component
						},
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				tabline = {
					lualine_a = {},
					lualine_b = { "branch" },
					lualine_c = { "filename" },
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})

			lualine.setup()
		end,
	},
}
