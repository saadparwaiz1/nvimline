local M = {}
local A = vim.api

M.mode = function (modes)
  modes = modes or {
    n = 'NORMAL',
    i = 'INSERT',
    R = 'REPLACE',
    c = 'COMMAND',
    t = 'TERMINAL',
    __index = function (_, _)
      return 'VISUAL'
    end
  }
  return modes[A.nvim_get_mode()['mode']]
end

M.buffers = function ()
  local buffers = vim.tbl_filter(function (buf)
    return buf > 0 and A.nvim_buf_get_option(buf, "buflisted") and A.nvim_buf_is_valid(buf)
  end, A.nvim_list_bufs())
  buffers = vim.tbl_map(A.nvim_buf_get_name, buffers)
  return buffers
end

M.git = function ()
  local head = vim.b.gitsigns_head
  local status = vim.b.gitsigns_status

  if head then
    local sep = ''
    if status ~= '' then
      sep = ' '
    end
    return ' '  .. head .. sep .. status
  end
  return nil
end

M.file = function ()
  return '%t'
end

M.info = function ()
  return '%l:%c %p%%'
end

return M
