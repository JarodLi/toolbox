-- local colorscheme = "tokyonight"
-- local colorscheme = "zephyr"
local colorscheme = "gruvbox"
-- local colorscheme = "OceanicNext"
-- local colorscheme = "onedarkpro"
-- local colorscheme = "nord"
-- local colorscheme = "sonokai"
-- local colorscheme = "nord"
-- local colorscheme = "nvcode"
-- local colorscheme = "edge"
-- local colorscheme = "OceanicNext"
-- local colorscheme = "melange"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
	return
end
