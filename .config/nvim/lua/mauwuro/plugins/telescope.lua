local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local ations_setup, actions = pcall(require, "telescope.actions")
if not ations_setup then
	return
end

local project_setup, project = pcall(require, "project_nvim")
if not project_setup then
	return
end

-- add project scope
telescope.load_extension("file_browser")

-- add project scope
project.setup({})

-- configure telescope
telescope.setup({
	extensions = {
		fzf = {
			fuzzy = false, -- false will only do exact matching, and true only fuzzy
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
	-- configure custom mappings
	defaults = {
		file_ignore_patterns = { "^.git/", "node_modules" },
		path_display = { "truncate" },
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
	},
	pickers = {
		find_files = {
			previewer = false,
			theme = "dropdown",
			hidden = true,
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("project")
telescope.load_extension("live_grep_args")
