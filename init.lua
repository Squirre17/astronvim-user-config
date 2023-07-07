local function addCscopeFile()
  -- 获取当前目录
  local currentDir = vim.fn.expand('%:p:h')

  -- 检查 cscope.out 文件是否存在
  local cscopeFile = currentDir .. '/cscope.out'
  local exists = vim.fn.filereadable(cscopeFile) == 1

  -- 如果文件存在，则执行命令 `cs add cscope.out`
  if exists then
    vim.api.nvim_command('cs add ' .. cscopeFile)
  end
end

-- 调用函数
addCscopeFile()

return {
}
