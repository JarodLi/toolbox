-- python3 -m pip install debugpy
function Split(s, delimiter)                                    
    local result = {}                                           
    for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)                             
    end                                                         
    return result
end

return {
	adapters = {
		type = "executable",
		command = "python3",
		args = { "-m", "debugpy.adapter" },
	},
	configurations = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			pythonPath = function()
				return vim.g.python_path
			end,
			 -- buildFlags = function()
			 --  local tags = vim.fn.input("Build tags: ")
			 --  return tags
			 -- end,
			 -- args = { "-m", "sql", "-c", "0" },
			 -- 支持传入参数，需要F9重启一次才能输入
			 args = function()
			     local args = vim.fn.input("run args: ")
			     return Split(args, " ")
			     -- local args_lst = vim.luaeval(args)
			 end,
		},
	},
}
