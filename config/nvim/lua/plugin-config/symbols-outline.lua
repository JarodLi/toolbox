local status, symbols_outline = pcall(require, "symbols-outline")
if not status then
	vim.notify("没有找到 symbols-outline")
	return
end



vim.g.symbols_outline = {
-- symbols_outline.setup({
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = false,
	position = "left",
	relative_width = true,
	width = 25,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	-- preview_bg_highlight = 'Pmenu',
	preview_bg_highlight = "Comment",
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		-- close = {"<Esc>", "q"},
		close = { "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
	},
	lsp_blacklist = {},
	symbol_blacklist = { "Variable" },
	-- symbols = {
	-- 	File = { icon = "", hl = "TSURI" },
	-- 	-- Module = { icon = "", hl = "TSNamespace" },
	-- 	Namespace = { icon = "", hl = "TSNamespace" },
	-- 	-- Package = { icon = "", hl = "TSNamespace" },
	-- 	Class = { icon = "𝓒", hl = "TSType" },
	-- 	Method = { icon = "ƒ", hl = "TSMethod" },
	-- 	-- Property = { icon = "", hl = "TSMethod" },
	-- 	Field = { icon = "", hl = "TSField" },
	-- 	Constructor = { icon = "", hl = "TSConstructor" },
	-- 	Enum = { icon = "ℰ", hl = "TSType" },
	-- 	Interface = { icon = "ﰮ", hl = "TSType" },
	-- 	Function = { icon = "", hl = "TSFunction" },
	-- 	-- Variable = { icon = "", hl = "TSConstant" },
	-- 	Constant = { icon = "", hl = "TSConstant" },
	-- 	String = { icon = "𝓐", hl = "TSString" },
	-- 	Number = { icon = "#", hl = "TSNumber" },
	-- 	Boolean = { icon = "⊨", hl = "TSBoolean" },
	-- 	Array = { icon = "", hl = "TSConstant" },
	-- 	Object = { icon = "⦿", hl = "TSType" },
	-- 	Key = { icon = "🔐", hl = "TSType" },
	-- 	Null = { icon = "NULL", hl = "TSType" },
	-- 	EnumMember = { icon = "", hl = "TSField" },
	-- 	Struct = { icon = "𝓢", hl = "TSType" },
	-- 	Event = { icon = "🗲", hl = "TSType" },
	-- 	Operator = { icon = "+", hl = "TSOperator" },
	-- 	-- TypeParameter = { icon = "𝙏", hl = "TSParameter" },
	-- },
  symbols = {
    File = { icon = "", hl = "@text.uri" },
    Module = { icon = "", hl = "@namespace" },
    Namespace = { icon = "", hl = "@namespace" },
    Package = { icon = "", hl = "@namespace" },
    Class = { icon = "𝓒", hl = "@type" },
    Method = { icon = "ƒ", hl = "@method" },
    Property = { icon = "", hl = "@method" },
    Field = { icon = "", hl = "@field" },
    Constructor = { icon = "", hl = "@constructor" },
    Enum = { icon = "ℰ", hl = "@type" },
    Interface = { icon = "ﰮ", hl = "@type" },
    Function = { icon = "", hl = "@function" },
    Variable = { icon = "", hl = "@constant" },
    Constant = { icon = "", hl = "@constant" },
    String = { icon = "𝓐", hl = "@string" },
    Number = { icon = "#", hl = "@number" },
    Boolean = { icon = "⊨", hl = "@boolean" },
    Array = { icon = "", hl = "@constant" },
    Object = { icon = "⦿", hl = "@type" },
    Key = { icon = "🔐", hl = "@type" },
    Null = { icon = "NULL", hl = "@type" },
    EnumMember = { icon = "", hl = "@field" },
    Struct = { icon = "𝓢", hl = "@type" },
    Event = { icon = "🗲", hl = "@type" },
    Operator = { icon = "+", hl = "@operator" },
    TypeParameter = { icon = "𝙏", hl = "@parameter" },
    Component = { icon = "", hl = "@function" },
    Fragment = { icon = "", hl = "@constant" },
  },
}
-- )

-- 待新版本允许在不开symbol时执行symbolclose时使用如下新配置 
-- local opts = {
--   highlight_hovered_item = true,
--   show_guides = true,
--   auto_preview = false,
--   position = 'left',
--   relative_width = true,
--   width = 25,
--   auto_close = false,
--   show_numbers = false,
--   show_relative_numbers = false,
--   show_symbol_details = true,
--   preview_bg_highlight = 'Pmenu',
--   autofold_depth = nil,
--   auto_unfold_hover = true,
--   fold_markers = { '', '' },
--   wrap = false,
--   keymaps = { -- These keymaps can be a string or a table for multiple keys
--     close = {"<Esc>", "q"},
--     goto_location = "<Cr>",
--     focus_location = "o",
--     hover_symbol = "<C-space>",
--     toggle_preview = "K",
--     rename_symbol = "r",
--     code_actions = "a",
--     fold = "h",
--     unfold = "l",
--     fold_all = "W",
--     unfold_all = "E",
--     fold_reset = "R",
--   },
--   lsp_blacklist = {},
--   symbol_blacklist = {},
--   symbols = {
--     File = { icon = "", hl = "@text.uri" },
--     Module = { icon = "", hl = "@namespace" },
--     Namespace = { icon = "", hl = "@namespace" },
--     Package = { icon = "", hl = "@namespace" },
--     Class = { icon = "𝓒", hl = "@type" },
--     Method = { icon = "ƒ", hl = "@method" },
--     Property = { icon = "", hl = "@method" },
--     Field = { icon = "", hl = "@field" },
--     Constructor = { icon = "", hl = "@constructor" },
--     Enum = { icon = "ℰ", hl = "@type" },
--     Interface = { icon = "ﰮ", hl = "@type" },
--     Function = { icon = "", hl = "@function" },
--     Variable = { icon = "", hl = "@constant" },
--     Constant = { icon = "", hl = "@constant" },
--     String = { icon = "𝓐", hl = "@string" },
--     Number = { icon = "#", hl = "@number" },
--     Boolean = { icon = "⊨", hl = "@boolean" },
--     Array = { icon = "", hl = "@constant" },
--     Object = { icon = "⦿", hl = "@type" },
--     Key = { icon = "🔐", hl = "@type" },
--     Null = { icon = "NULL", hl = "@type" },
--     EnumMember = { icon = "", hl = "@field" },
--     Struct = { icon = "𝓢", hl = "@type" },
--     Event = { icon = "🗲", hl = "@type" },
--     Operator = { icon = "+", hl = "@operator" },
--     TypeParameter = { icon = "𝙏", hl = "@parameter" },
--     Component = { icon = "", hl = "@function" },
--     Fragment = { icon = "", hl = "@constant" },
--   },
-- }
-- symbols_outline.setup(opts)

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

map("n", "<A-`>", "<cmd>SymbolsOutline<cr>", opt)
