return {
	"windwp/nvim-ts-autotag",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local setup, gitsigns = pcall(require, "gitsigns")
			if not setup then
				return
			end

			-- configure/enable gitsigns
			gitsigns.setup()
		end,
	},
	{ "TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim" },
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "github/copilot.vim" },
}
