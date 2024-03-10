local conform_status, conform = pcall(require, "conform")
if not conform_status then
  return
end

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    go = { "gofmt" },
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
})
