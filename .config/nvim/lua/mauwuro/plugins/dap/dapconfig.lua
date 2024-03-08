local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
  print("nvim-dap not installed!")
  return
end

require("dap").set_log_level("INFO") -- Helps when configuring DAP, see logs with :DapShowLog

dap.configurations = {
  go = {
    {
      type = "go",         -- Which adapter to use
      name = "Debug",      -- Human readable name
      request = "launch",  -- Whether to "launch" or "attach" to program
      program = "${file}", -- The buffer you are focused on when running nvim-dap
    },
  },
}

dap.adapters.go = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}
