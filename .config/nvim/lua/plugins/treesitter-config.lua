return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			-- import nvim-treesitter plugin safely
			local status, treesitter = pcall(require, "nvim-treesitter.configs")
			if not status then
				return
			end
			-- configure treesitter
			treesitter.setup({
				-- enable syntax highlighting
				highlight = {
					enable = true,
				},
				rainbow = {
					enable = true,
					-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
					extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					max_file_lines = nil, -- Do not enable for files with more than n lines, int
					colors = {
						"#bf616a",
						"#d08770",
						"#ebcb8b",
						"#a3be8c",
						"#88c0d0",
						"#5e81ac",
						"#b48ead",
					}, -- table of hex strings
					-- termcolors = {} -- table of colour name strings
				},
				-- enable indentation
				indent = { enable = true },
			})
		end,
	},
	{
		"nvim-ts-autotag",
		config = function()
			-- import nvim-treesitter plugin safely
			local status, autotag = pcall(require, "nvim-ts-autotag")
			if not status then
				return
			end
			autotag.setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				per_filetype = {
					["html"] = {
						enable_close = false,
					},
				},
			})
		end,
	},
}
