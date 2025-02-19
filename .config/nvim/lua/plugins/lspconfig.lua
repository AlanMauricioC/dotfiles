return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- import lspconfig plugin safely
			local lspconfig_status, lspconfig = pcall(require, "lspconfig")
			if not lspconfig_status then
				return
			end

			-- import cmp-nvim-lsp plugin safely
			local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
			if not cmp_nvim_lsp_status then
				return
			end
			local cmp_status, cmp = pcall(require, "cmp")
			if not cmp_status then
				return
			end

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-a>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				}, {
					{ name = "buffer" },
				}),
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			-- cmp.setup.cmdline(':', {
			--   mapping = cmp.mapping.preset.cmdline(),
			--   sources = cmp.config.sources({
			--     { name = 'path' }
			--   }, {
			--     { name = 'cmdline' }
			--   })
			-- })

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- enable keybinds only for when lsp server available
			local on_attach_TS = function(client, _)
				local keymap = vim.keymap -- for conciseness
				-- typescript specific keymaps (e.g. rename file and update imports)
				if client.name == "ts_ls" then
					keymap.set("n", "<leader>crf", ":TypescriptRenameFile<CR>") -- rename file and update imports
					keymap.set("n", "<leader>coi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
					keymap.set("n", "<leader>cru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
				end
			end

			-- configure go server
			lspconfig["gopls"].setup({
				capabilities = capabilities,
			})

			-- configure go server
			lspconfig["pyright"].setup({
				capabilities = capabilities,
			})

			-- configure html server
			lspconfig["html"].setup({
				capabilities = capabilities,
			})

			-- configure typescript server with plugin
			lspconfig["ts_ls"].setup({
				root_dir = lspconfig.util.root_pattern("package.json"),
			})

			-- configure css server
			lspconfig["cssls"].setup({
				capabilities = capabilities,
			})

			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				settings = {
					-- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			-- Change the Diagnostic symbols in the sign column (gutter)
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
		},
	},
}
