if exists('g:loaded_nvimline') || !has('nvim-0.5')
  finish
endif

let g:loaded_nvimline = 1

augroup nvimline_highlights
  autocmd!
  autocmd VimEnter,ColorScheme * call nvimline#highlight()
augroup END
