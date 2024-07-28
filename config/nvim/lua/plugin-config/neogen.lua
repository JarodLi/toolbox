 require('neogen').setup {
     enabled = true,
     languages = {
         lua = {
             template = {
                 annotation_convention = "emmylua" -- for a full list of annotation_conventions, see supported-languages below,
                 }
         },
         python = {
             template = {
                 -- annotation_convention = "google_docstrings"
                 -- annotation_convention = "numpydoc"
                 annotation_convention = "reST"
                 }
         },
     }
 }

 local opts = { noremap = true, silent = true }
 vim.api.nvim_set_keymap("n", "<Leader>doc", ":lua require('neogen').generate()<CR>", opts)
