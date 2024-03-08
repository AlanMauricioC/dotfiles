-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	require("notify")("cmp_nvim_lsp not installed!", "warning") -- nvim-notify is a separate plugin, I recommend it too!
	return
end
