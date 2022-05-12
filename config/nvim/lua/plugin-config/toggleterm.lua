require("toggleterm").setup({                
   size = function(term)
   if term.direction == "horizontal" then
   return 10
   elseif term.direction == "vertical" then
   return vim.o.columns * 0.4
   end
   end,
   -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
   direction = "float",
   close_on_exit = true, -- close the terminal window when the process exits
   shell = "fish", -- change the default shell
   -- This field is only relevant if direction is set to 'float'
   float_opts = {
   -- The border key is *almost* the same as 'nvim_open_win'
   -- see :h nvim_open_win for details on borders however
   -- the 'curved' border is a custom border type
   -- not natively supported but implemented in this plugin.
   -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
   border = "curved",
   width = 95,
   height = 25,
   -- winblend = 3,
   },
   })

   local map = vim.api.nvim_set_keymap
   local opt = { noremap = true, silent = true }

   map("n", "<F12>", ":ToggleTerm direction=float<CR>", opt)
 map("t", "<F12>", "<C-\\><C-n><C-W>l", opt)

   map("n", "<tab><space>", ":ToggleTerm direction=horizontal<CR>", opt)
   --  从term中退出
   map("t", "<tab><space>", "<C-\\><C-n><C-W>k:ToggleTerm<CR>", opt)
   map("t", "<tab>h", "<C-\\><C-n><C-W>h", opt)
   map("t", "<tab>l", "<C-\\><C-n><C-W>l", opt)
   map("t", "<tab>j", "<C-\\><C-n><C-W>j", opt)
   map("t", "<tab>k", "<C-\\><C-n><C-W>k", opt)
   map("t", "<esc>", "<C-\\><C-n>", opt)


 local function inInsert()                                                                                                                         Thu 20:53
   -- 删除 Esc 的映射                                            ).lazygit_toggle()<CR>", vim.keybinds.opts)
   vim.keybinds.dgmap("t", "<Esc>")
   end

   local Toggleterm = require("toggleterm")
   -- 新建终端
   local Terminal = require("toggleterm.terminal").Terminal
   -- 新建 lazygit 终端
   local lazyGit = Terminal:new({
   cmd = "lazygit",
   hidden = true,
   direction = "float",C-
   float_opts = {
   -- The border key is *almost* the same as 'nvim_open_win'
   -- see :h nvim_open_win for details on borders however
   -- the 'curved' border is a custom border type
   -- not natively supported but implemented in this plugin.
   -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
   border = "curved",
   width = 125,
   height = 32,
   -- winblend = 3,
   },
 inInsert()
   -- lazygit 中 q 是退出
   vim.keybinds.bmap(term.bufnr, "i", "q", "<cmd>close<CR>", vim.keybinds.opts)
   end,
   on_close = function()
   -- 重新映射 Esc
   vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
   end,
   })
   -- 定义新的方法
   -- Toggleterm.float_toggle = function()
   -- floatTerm:toggle()
   -- end
   Toggleterm.lazygit_toggle = function()
   lazyGit:toggle()
   end

   -- 打开lazy git 终端
   vim.keybinds.gmap("n", "<F11>", "<cmd>lua require('toggleterm').lazygit_toggle()<CR>", vim.keybinds.opts)
   map("t", "<F11>", "<C-\\><C-n><C-W>l", opt)


