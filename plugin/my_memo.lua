-- plugin/my_memo.lua

vim.api.nvim_create_user_command('Memo', function()
  require('memoru').toggle()
end, {})

vim.keymap.set('n', '<leader>memo', '<cmd>Memo<CR>', { 
  noremap = true, 
  silent = true, 
  desc = "メモウィンドウの切り替え" 
})
