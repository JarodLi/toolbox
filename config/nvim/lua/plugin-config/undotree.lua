 -- 指定 undotree 缓存存放路径                                                                                                                  
   vim.g.undotree_dir = "~/.cache/nvim/undodir"

   vim.cmd([[
   if has("persistent_undo")
       " 在 config.lua 中定义好了 undotree_dir 全局变量
       let target_path = expand(undotree_dir)
       if !isdirectory(target_path)
           call mkdir(target_path, "p", 0700)
       endif
       let &undodir = target_path
       set undofile
   ]])
   -- 按键绑定，查看 undotree
   vim.keybinds.gmap("n", "<leader>u", ":UndotreeToggle<CR>", vim.keybinds.opts)
