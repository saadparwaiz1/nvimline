-- vim: set foldmethod=marker foldlevel=1 nomodeline:
-- ============================================================================
-- Utilities {{{
-- ============================================================================
local function line(fmt) vim.o.statusline = vim.o.statusline .. fmt end

local function current_mode()
    local mode = vim.fn.mode()
    if mode == 'n' then return 'NORMAL' end
    if mode == 'i' then return 'INSERT' end
    if mode == 'R' then return 'REPLACE' end
    if mode == 'c' then return 'COMMAND' end
    if mode == 't' then return 'TERMINAL' end
    return 'VISUAL'
end

local function git_branch()
    local git_info = vim.b.git_info
    local cwd = vim.fn.expand('%:p:h')

    if git_info then return git_info end

    local branch = vim.fn.system('cd ' .. cwd ..
                                   ' &> /dev/null && git branch --show-current 2> /dev/null | tr -d "\n"')

    if branch == '' or not branch then
        branch = 'darwin'
    else
        branch = ' ' .. branch
    end

    vim.b.git_info = branch

    return branch
end

local function _is_valid(bnum)
    if not bnum or bnum < 1 then return false end

    return vim.api.nvim_buf_get_option(bnum, "buflisted") and
             vim.api.nvim_buf_is_valid(bnum)
end

local function list_valid_buffers()
    local buf_nums = vim.api.nvim_list_bufs()
    local valid_bufs = {}

    local count = 1
    for _, buf in ipairs(buf_nums) do
        if _is_valid(buf) then
            valid_bufs[count] = buf
            count = count + 1
        end
    end
    return valid_bufs
end

local function bufferline()
    local buffers = list_valid_buffers()
    local bufline = {}
    local this = vim.api.nvim_buf_get_name(vim.fn.bufnr('%'))

    for _, v in pairs(buffers) do
        local name = vim.api.nvim_buf_get_name(v)

        if name == this then
            if name == '' then
                name = '[No Name]'
            else
                name = vim.fn.fnamemodify(name, ':t')
            end
            table.insert(bufline,
                         '%#VimlineExtSeperator#%#VimlineExt#' .. name ..
                           '%#VimlineExtSeperator#%#VimlineSubStatusLine#')
        else
            if name == '' then
                name = '[No Name]'
            else
                name = vim.fn.fnamemodify(name, ':t')
            end
            table.insert(bufline,
                         '%#VimlineFileSeperator#%#VimlineFile#' .. name ..
                           '%#VimlineFileSeperator#%#VimlineSubStatusLine#')
        end
    end

    return table.concat(bufline, ' ')
end

_G.vimline_bufferline = bufferline
_G.vimline_current_mode = current_mode
_G.vimline_git_branch = git_branch
-- }}}
-- ============================================================================
-- Vim Line {{{
-- ============================================================================
vim.o.statusline = ''
vim.o.tabline = [[%!v:lua.vimline_bufferline()]]

line(
  [[%#VimlineSeperator#%#VimlineMode#%{v:lua.vimline_current_mode()}%#VimlineSeperator#%#VimlineSubStatusLine# ]])
line(
  "%#VimlineFileSeperator#%#VimlineFile#%t%#VimlineFileSeperator#%#VimlineSubStatusLine# ")
line(
  [[%#VimlineGitSeperator#%#VimlineGit#%{v:lua.vimline_git_branch()}%#VimlineGitSeperator#%#VimlineSubStatusLine#  ]])
line("%#VimlineSubStatusLine#%=")
line(
  "%#VimlineErrorSeperator#%#VimlineError#E:%{luaeval('vim.lsp.diagnostic.get_count(0, [[Error]])')} ")
line(
  "%#VimlineWarning# W:%{luaeval('vim.lsp.diagnostic.get_count(0, [[Warning]])')}%#VimlineWarningSeperator#%#VimlineSubStatusLine# ")
line(
  "%#VimlineLineSeperator#%#VimlineLine#%l:%c %p%%%#VimlineLineSeperator#")
-- }}}
-- ============================================================================
