1. nvim插件包packer.tar.gz打包方式
1）打开nvim，执行:PackerCompile, :PackerUpdate下载插件包到packer目录
2）打开nvim，执行：TSUpdate，下载treesitter so包到packer/nvim-treesitter/parser




从nvim0.7切换到nvim0.9问题记录：
1. bufferline不可用
解决方案：和lualine有冲突，将lualine中的如下配置删除
tabline = {                 
lualine_a = {},             
-- lualine_b = {'branch'},  
lualine_c = {'filename'},   
lualine_x = {},             
lualine_y = {},             
lualine_z = {}              
2. nvim-tree不可用
解决方案：nvim-tree中配置变更较多，按照最新的要求删除不支持的配置即可。 变化较大的是keylist映射部分，要用on_attach方法重写（可以用nvim-tree提供的迁移命令生成代码）
3. symbols-outline不可用
解决方法：1. 解决了nvim-tree的问题就可以使用了（能正常打开）
2. 退回到老版本symbols-outline（解决symbolclose报错问题）
新版本和老版本最大区别是，新版本使用setup()方式启动
4. cscope不可用
解决方案：nvim不再支持cscope，将gtags.vim，cscope.vim，gutentags.vim，gutentags_plus.vim删掉即可
5. lsp不可用
1) 更新所有lsp_server,   删除/root/.local/nvim/lsp_servers，启动nvim默认更新，也可以通过执行：LspInstall xxx安装，通过:LspInstallInfo查看安装进度
6. null-ls不可用
1）修改formating接口： vim.lsp.buf.formatting() -> vim.lsp.buf.format()
2) 默认支持了range formate能力，直接调用： map("v", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opt)，删掉原来的format_range_operator
7. 跳转不可用
1）修改lsp/xx.lua下面的所有文件，替换接口：
client.resolved_capabilities.document_formatting = false -> client.server_capabilities.documentFormattingProvider = false
client.resolved_capabilities.document_range_formatting = false -> client.server_capabilities.documentRangeFormattingProvider = false
2)删掉 lua.lua和json.lua里的lua vim.lsp.buf.formatting_sync()
7. nvim-lint不可用
TODO：替换成老版本还是不行，怀疑和lsp相关。  注意：nvim-lint的包是放在opt下面，而不是start下面
1) flake8执行失败原因： 参数改为/root/py_check/tox.ini不存在。  定位方式：可以手工执行lint命令，如果报错，是无法显示virtual_text的
2）pylint失败原因：args里加上"-f"
3) 调用在lspconfig中定义的open_diagnose()，否则显示格式未生效
8. 补全信息图标显示错误
替换成老版本的lskind  --或许是因为nerd字体原因
9. lualine状态 lint图标显示错误
怀疑：需要更新最新的nvim-tree/nvim-web-devicons
--上述两个字体显示问题，通过安装nerd补丁解决（从https://github.com/ryanoasis/nerd-fonts/releases行的sourcecodepro补丁安装，在msys2上选择SauceCodePro Nerd Font Mono字体使用
10. dashboard不显示
dashboard更新版本，配置要重写
