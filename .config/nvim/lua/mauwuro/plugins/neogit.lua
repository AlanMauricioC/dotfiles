-- import gitsigns plugin safely
local setup, neogit = pcall(require, "neogit")
if not setup then
	return
end

-- configure/enable gitsigns
neogit.setup()
