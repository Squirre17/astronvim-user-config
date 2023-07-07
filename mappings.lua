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

return maps;
