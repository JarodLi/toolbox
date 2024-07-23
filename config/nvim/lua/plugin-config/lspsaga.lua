-- https://github.com/tami5/lspsaga.nvim
-- 引入 lspsaga 插件
require('lspsaga').setup({
  -- 启用或禁用内置的代码操作面板
  -- code_action_icon = "💡",
  -- 启用或禁用诊断信息面板
  -- diagnostic_header_icon = "🚦",
  -- -- 定义诊断信息的图标
  -- diagnostic_trouble_icon = "🆘",
  -- -- 定义定义跳转的图标
  -- finder_definition_icon = "🔍",
  -- -- 定义引用跳转的图标
  -- finder_reference_icon = "🌐",
  -- -- 定义实现跳转的图标
  -- implement_definition_icon = "🛠️",
  -- -- 定义类型定义跳转的图标
  -- type_definition_icon = "📝",
  -- -- 启用或禁用自动预览
  -- auto_preview = true,
  -- -- 定义自动预览的延迟（毫秒）
  -- auto_preview_delay = 80,
  -- -- 定义自动预览的最大行数
  -- max_preview_lines = 10,
  -- -- 定义代码操作的快捷键
  -- code_action_keys = {
  --   quit = { 'q', '<Esc>' },
  --   exec = 'r',
  -- },
  -- -- 定义其他 lspsaga 功能和行为的设置
  -- signs = {
  --   error = {
  --     text = '', -- 错误标志的文本
  --     hl = 'LspDiagnosticsSignError', -- 错误标志的高亮组
  --   },
  --   warn = {
  --     text = '', -- 警告标志的文本
  --     hl = 'LspDiagnosticsSignWarning',
  --   },
  --   info = {
  --     text = '', -- 信息标志的文本
  --     hl = 'LspDiagnosticsSignInformation',
  --   },
  --   hint = {
  --     text = ' ', -- 提示标志的文本
  --     hl = 'LspDiagnosticsSignHint',
  --   },
  -- },
  -- 启用内置的诊断信息显示
  boder_style = 'round',
  diagnostic = {
    -- enable = true,
    --     -- 设置侧边栏诊断信息的标志
    signs = {
      enable = true,
      error = "",  -- 错误标志的图标
      -- warn = "",   -- 警告标志的图标
      warn = "A",   -- 警告标志的图标
      info = "",   -- 信息标志的图标
      hint = "",   -- 提示标志的图标
    }
  },
})
