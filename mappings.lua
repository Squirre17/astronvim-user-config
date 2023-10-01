local maps = { i = {}, n = {}, v = {}, t = {} };

-- toggle terminal
maps.n["<F1>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
maps.t["<F1>"] = maps.n["<F1>"]
maps.n["<C-'>"] = maps.n["<F1>"] -- requires terminal that supports binding <C-'>
maps.t["<C-'>"] = maps.n["<F1>"] -- requires terminal that supports binding <C-'>

-- add cscope mapping
maps.n["<leader>ag"] = { function() vim.api.nvim_command("cs find g " .. vim.fn.expand("<cword>")) end , desc = "Find this definition" }
maps.n["<leader>ac"] = { function() vim.api.nvim_command("cs find c " .. vim.fn.expand("<cword>")) end , desc = "Find functions calling this function" }
maps.n["<leader>ad"] = { function() vim.api.nvim_command("cs find d " .. vim.fn.expand("<cword>")) end , desc = "Find functions called by this function" }
maps.n["<leader>ae"] = { function() vim.api.nvim_command("cs find e " .. vim.fn.expand("<cword>")) end , desc = "Find this egrep pattern" }
maps.n["<leader>af"] = { function() vim.api.nvim_command("cs find f " .. vim.fn.expand("<cword>")) end , desc = "Find this file" }
maps.n["<leader>ai"] = { function() vim.api.nvim_command("cs find i " .. vim.fn.expand("<cword>")) end , desc = "Find files #including this file" }
maps.n["<leader>as"] = { function() vim.api.nvim_command("cs find s " .. vim.fn.expand("<cword>")) end , desc = "Find this C symbol" }
maps.n["<leader>at"] = { function() vim.api.nvim_command("cs find t " .. vim.fn.expand("<cword>")) end , desc = "Find this text string" }

-- set plugin "ojroques/nvim-osc52"
require('osc52').setup {
  max_length = 0,      -- Maximum length of selection (0 for no limit)
  silent     = false,  -- Disable message on successful copy
  trim       = false,  -- Trim surrounding whitespaces before copy
}

-- I don't know why it not work :<
-- maps.n[";c"] = { '<cmd>"+y<cr>', desc = "Copy content to system clipboard" }
-- maps.n[";cc"] = { '<cmd>"+yy<cr>', desc = "Copy content to system clipboard" }
-- maps.v[";c"] = { '<cmd>"+y<cr>', desc = "Copy content to system clipboard" }
-- maps.v[";cc"] = { '<cmd>"+yy<cr>', desc = "Copy content to system clipboard" }

vim.keymap.set('n', ';c', '"+y')
vim.keymap.set('n', ';cc', '"+yy')
vim.keymap.set('v', ';c', '"+y')
vim.keymap.set('v', ';cc', '"+yy')


local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
end

vim.g.clipboard = {
  name = 'osc52',
  copy = {['+'] = copy, ['*'] = copy},
  paste = {['+'] = paste, ['*'] = paste},
}


return maps;
