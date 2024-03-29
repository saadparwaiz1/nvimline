local M = {}
local A = vim.api

M.setup = function ()
  M.components = require('nvimline.components')
  vim.o.statusline = [[%!luaeval("require('nvimline').statusline()")]]
  vim.o.tabline = [[%!luaeval("require('nvimline').bufferline()")]]
end

M.bufferline = function ()
  local buffers = M.components.buffers()
  local this = A.nvim_get_current_buf()
  local bufline = {}
  local name = A.nvim_buf_get_name(this)
  for _, v in pairs(buffers) do
    if v == name then
      if v == '' then
        v = 'Buffer ' .. tostring(this)
      else
        local sep = ''
        if vim.bo.modified then sep = ' ' end
        v = vim.fn.fnamemodify(v, ':t') .. sep
      end
      table.insert(bufline, '%#VimlineActiveFileSep#%#VimlineActiveFile#' .. v ..  '%#VimlineActiveFileSep#%#VimlineSubStatusLine#')
    else
      if v == '' then
        v = 'Buffer ' .. tostring(this)
      else
        v = vim.fn.fnamemodify(v, ':t')
      end
      table.insert(bufline, '%#VimlineInActiveFileSep#%#VimlineInActiveFile#' .. v ..  '%#VimlineInActiveFileSep#%#VimlineSubStatusLine#')
    end
  end
  return table.concat(bufline, ' ')
end

M.statusline = function ()
  local git = M.components.git()
  local mode_info = M.components.mode()
  local mode, highlight = unpack(mode_info)
  local info = M.components.info()
  local statusline = {}
  table.insert(statusline, [[%#VimlineSeperator]]..highlight..[[#%#VimlineMode]]..highlight..[[#]]..mode..[[%#VimlineSeperator]]..highlight..[[#%#VimlineSubStatusLine#]])
  if git then
    table.insert(statusline, [[%#VimlineGitSeperator#%#VimlineGit#]]..git..[[%#VimlineGitSeperator#%#VimlineSubStatusLine#]])
  end
  table.insert(statusline, [[%#VimlineSubStatusLine#%=]])
  table.insert(statusline,[[%#VimlineLineSeperator#%#VimlineLine#]]..info..[[%#VimlineLineSeperator#]])
  return table.concat(statusline, ' ')
end


A.nvim_exec([[
  augroup nvimline_highlights
    autocmd!
    autocmd VimEnter,ColorScheme * call nvimline#highlight()
  augroup END
]], false)

return M
