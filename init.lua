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

-- local function clipboard_yank()
--     vim.api.nvim_command("echom clipboard_yank")
--     vim.fn.system('xclip -i -selection clipboard', vim.fn.getreg('"'))
-- end
--
-- local function clipboard_paste()
--     vim.api.nvim_command("echom clipboard_paste")
--     vim.fn.setreg('"', vim.fn.system('xclip -o -selection clipboard'))
--     -- vim.cmd('normal! p')
-- end
--
-- vim.api.nvim_set_keymap('v', 'y', ':<C-u>lua clipboard_yank()<CR>', { silent = true })
-- vim.api.nvim_set_keymap('v', 'd', ':<C-u>lua clipboard_yank()<CR>', { silent = true })
-- vim.api.nvim_set_keymap('n', 'p', ':<C-u>lua clipboard_paste()<CR>p', { silent = true })


-- vim.g.clipboard = {
--     name = 'WslClipboard',
--     copy = {
--         ['+'] = 'clip.exe',
--         ['*'] = 'clip.exe',
--     },
--     paste = {
--         ['+'] = 'vim.fn.system("powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace(\"`r\", \"\"))")',
--         ['*'] = 'vim.fn.system("powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace(\"`r\", \"\"))")',
--     },
--     cache_enabled = 0,
-- }

-- set plugin "ojroques/nvim-osc52"

return {
}
