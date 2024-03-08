vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local wk = require("which-key")

-- general keymaps
--
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search

keymap.set("n", "x", '"_x')

-- comment
-- gc to comment

-- window management
wk.register({
  w = {
    name = "Window",
  },
}, { prefix = "<leader>" })
keymap.set("n", "<leader>wv", "<C-w>v")
keymap.set("n", "<leader>ws", "<C-w>s")
keymap.set("n", "<leader>we", "<C-w>=")
keymap.set("n", "<leader>wc", "<cmd>close<CR>")

-- tab management
wk.register({
  t = {
    name = "Tabs",
  },
}, { prefix = "<leader>" })
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>")
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>")
keymap.set("n", "<leader>th", "<cmd>tabp<CR>")

-- buffers
wk.register({
  b = {
    name = "Buffer",
  },
}, { prefix = "<leader>" })
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>")
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>")
keymap.set("n", "<leader>bk", "<cmd>bprevious|bdelete #<CR>")
keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>")

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- telescope
wk.register({
  f = {
    name = "File",
  },
}, { prefix = "<leader>" })
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fr", "<cmd>Telescope file_browser<cr>")
keymap.set("n", "<leader>f.", "<cmd>Telescope file_browser path=%:p:h<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fa", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<cr>")

-- file-management
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")

-- git status
wk.register({
  g = {
    name = "Git",
    b = "Blame",
    h = "Hunk",
    l = "List",
  },
}, { prefix = "<leader>" })

keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>")
keymap.set("n", "<leader>gbl", "<cmd>Gitsigns blame_line<CR>")
keymap.set("n", "<leader>gbt", "<cmd>Gitsigns toggle_current_line_blame<CR>")
keymap.set("n", "<leader>glb", "<cmd>Telescope git_branches<cr>")
keymap.set("n", "<leader>glf", "<cmd>Telescope git_files<cr>")
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")
keymap.set("n", "<leader>gbc", "<cmd>Telescope git_bcommits<cr>")
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
keymap.set("n", "<leader>gS", "<cmd>Telescope git_stash<cr>")


keymap.set({ "o", "x" }, "ih", "<cmd>Gitsigns select_hunk<CR>")
keymap.set("n", "<leader>gj", "<cmd>Gitsigns next_hunk<CR>", { desc = "Git Next Hunk" })
keymap.set("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Git Prev Hunk" })
keymap.set("n", "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>")
keymap.set("n", "<leader>ghS", "<cmd>Gitsigns undo_stage_hunk<CR>")
keymap.set("n", "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>")
keymap.set("n", "<leader>ghR", "<cmd>Gitsigns reset_hunk<CR>")


-- LSP stuff
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
keymap.set("n", "<leader>cd", "<cmd>Lspsaga hover_doc<CR>")
keymap.set("n", "<leader>cw", "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
keymap.set({ "n", "v" }, "ff", vim.lsp.buf.format)
-- extra keymaps ../plugins/lsp/lspsaga.lua

-- snippets
-- local ls = require("luasnip")
-- keymap.set({ "i", "s" }, "<TAB>", function()
--   ls.jump(1)
-- end, { silent = true })
-- keymap.set({ "i", "s" }, "<S-TAB>", function()
--   ls.jump(-1)
-- end, { silent = true })
