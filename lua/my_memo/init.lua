-- lua/my_memo/init.lua

local M = {}

local win_id = nil
local buf_id = nil

function M.toggle()
  local filepath = vim.fn.expand("~/memo.txt")

  if win_id and vim.api.nvim_win_is_valid(win_id) then
    vim.api.nvim_win_hide(win_id)
    win_id = nil
    return
  end

  if not buf_id or not vim.api.nvim_buf_is_valid(buf_id) then
    buf_id = vim.fn.bufnr(filepath, true)
    vim.fn.bufload(buf_id)
    vim.api.nvim_set_option_value('filetype', 'markdown', { buf = buf_id })
  end

  local columns = vim.o.columns
  local lines = vim.o.lines
  local width = math.floor(columns * 0.3)
  local height = math.floor(lines * 0.4)
  
  local row = lines - height - 3
  local col = columns - width - 1

  local opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
    title = ' Memo ',
    title_pos = 'center',
  }

  win_id = vim.api.nvim_open_win(buf_id, true, opts)
end

return M
