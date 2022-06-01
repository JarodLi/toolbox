-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("没有找到 lualine")
  return
end

lualine.setup({
  options = {
    -- theme = "tokyonight",
    -- theme = "nord",
    theme = "gruvbox",
    -- component_separators = { left = "|", right = "|" },
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    -- https://github.com/ryanoasis/powerline-extra-symbols
    -- section_separators = { left = " ", right = "" },
    -- disabled_filetypes = { "dapui_scopes", "dapui_watches", "dapui_stacks", "dapui_breakpoints" },
    disabled_filetypes = { "dashboard" },
    always_divide_middle = true,
    globalstatus = false,
  },
  extensions = { "nvim-tree", "toggleterm" },
  sections = {
    lualine_c = {
      "filename",
      {
        "lsp_progress",
        spinner_symbols = { " ", " ", " ", " ", " ", " " },
      },
    },
    lualine_x = {
      -- "filesize",
      {
        "fileformat",
        symbols = {
          unix = '', -- e712
          dos = '', -- e70f
          mac = '', -- e711
        },
        -- symbols = {
        --   unix = "LF",
        --   dos = "CRLF",
        --   mac = "CR",
        -- },
      },
      "encoding",
      "filetype",
    },
  },


  tabline = {
  lualine_a = {},
  -- lualine_b = {'branch'},
  lualine_c = {'filename'},
  lualine_x = {},
  lualine_y = {},
  lualine_z = {}
},
})
-- vim.cmd("autocmd FileType dap_scopes set statusline=")
-- vim.cmd("autocmd FileType dap_watches set statusline=")
-- vim.cmd("autocmd FileType dap_stacks set statusline=")
-- vim.cmd("autocmd FileType dap_breakpoints set statusline=")
-- vim.cmd("autocmd FileType dap-repl set statusline=")
