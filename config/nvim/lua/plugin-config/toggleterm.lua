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
   map("n", "<leader><space>", ":ToggleTerm direction=horizontal<CR>", opt)
   map("t", "<c-h>", "<C-\\><C-n><C-W>h", opt)
   map("t", "<c-l>", "<C-\\><C-n><C-W>l", opt)
   map("t", "<c-j>", "<C-\\><C-n><C-W>j", opt)
   map("t", "<c-k>", "<C-\\><C-n><C-W>k", opt)
   map("t", "<esc>", "<C-\\><C-n>", opt)
