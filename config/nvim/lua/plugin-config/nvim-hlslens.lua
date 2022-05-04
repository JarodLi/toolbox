-- https://github.com/kevinhwang91/nvim-hlslens

require("hlslens").setup({
	calm_down = true,
	-- nearest_only = true,
	-- nearest_float_when = "always",
	override_lens = function(render, plist, nearest, idx, r_idx)
		local sfw = vim.v.searchforward == 1
		local indicator, text, chunks
		local abs_r_idx = math.abs(r_idx)
		if abs_r_idx > 1 then
			indicator = ("%d%s"):format(abs_r_idx, sfw ~= (r_idx > 1) and "▲" or "▼")
		elseif abs_r_idx == 1 then
			indicator = sfw ~= (r_idx == 1) and "▲" or "▼"
		else
			indicator = ""
		end

		local lnum, col = unpack(plist[idx])
		if nearest then
			local cnt = #plist
			if indicator ~= "" then
				text = ("[%s %d/%d]"):format(indicator, idx, cnt)
			else
				text = ("[%d/%d]"):format(idx, cnt)
			end
			chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
		else
			text = ("[%s %d]"):format(indicator, idx)
			chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
		end
		render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
	end,
})

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

map("n", "n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], opt)
map("n", "N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], opt)
map("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], opt)
map("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], opt)
map("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], opt)
map("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], opt)

-- vim.api.nvim_set_keymap('n', '<Leader>l', ':noh<CR>', kopts)
