local M = {}
local A = vim.api

M.setup = function (components)
  components = components or {}
  M.components = vim.tbl_extend('force', require('nvimline.components'), components)
  vim.o.statusline = [[%!v:lua.nvimline_statusline()]]
  vim.o.tabline = [[%!v:lua.nvimline_bufferline()]]
end

_G.nvimline_bufferline = function ()
  local buffers = M.components.buffers()
  local this = A.nvim_get_current_buf()
  local bufline = {}
  this = A.nvim_buf_get_name(this)
  for _, v in pairs(buffers) do
    if v == this then
      if v == '' then
        v = '[No Name]'
      else
         v = vim.fn.fnamemodify(v, ':t')
      end
      table.insert(bufline, '%#VimlineActiveFileSep#%#VimlineActiveFile#' .. v ..  '%#VimlineActiveFileSep#%#VimlineSubStatusLine#')
    else
      if v == '' then
          v = '[No Name]'
      else
          v = vim.fn.fnamemodify(v, ':t')
      end
      table.insert(bufline, '%#VimlineInActiveFileSep#%#VimlineInActiveFile#' .. v ..  '%#VimlineInActiveFileSep#%#VimlineSubStatusLine#')
    end
  end
  return table.concat(bufline, ' ')
end

_G.nvimline_statusline = function ()
  local git = M.components.git()
  local mode_info = M.components.mode()
  local mode = mode_info[1]
  local highlight = mode_info[2]
  local file = M.components.file()
  local info = M.components.info()
  local statusline = {}
  table.insert(statusline, [[%#VimlineSeperator]]..highlight..[[#%#VimlineMode]]..highlight..[[#]]..mode..[[%#VimlineSeperator]]..highlight..[[#%#VimlineSubStatusLine#]])
  if git then
    table.insert(statusline, [[%#VimlineGitSeperator#%#VimlineGit#]]..git..[[%#VimlineGitSeperator#%#VimlineSubStatusLine#]])
  end
  table.insert(statusline, [[%#VimlineFileSeperator#%#VimlineFile#]]..file..[[%#VimlineFileSeperator#%#VimlineSubStatusLine#]])
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
