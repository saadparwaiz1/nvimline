function! nvimline#highlight() abort
  hi VimlineSubStatusLine guifg=NONE guibg=NONE guisp=NONE gui=NONE
  hi VimlineSeperator guifg=#a0c980 guibg=#34343c guisp=NONE gui=NONE
  hi VimlineMode guifg=#282828 guibg=#a0c980 guisp=NONE gui=bold
  hi VimlineFileSeperator guifg=#c5cdd9 guibg=#34343c guisp=NONE gui=NONE
  hi VimlineFile guifg=#282828 guibg=#c5cdd9 guisp=NONE gui=NONE
  hi VimlineGitSeperator guifg=#d38aea guibg=#34343c guisp=NONE gui=NONE
  hi VimlineGit guifg=#282828 guibg=#d38aea guisp=NONE gui=NONE
  hi VimlineGitSeperator guifg=#d38aea guibg=#34343c guisp=NONE gui=NONE
  hi VimlineGit guifg=#282828 guibg=#d38aea guisp=NONE gui=NONE
  hi VimlineLineSeperator guifg=#57595e guibg=#34343c guisp=NONE gui=NONE
  hi VimlineLine guifg=#c5cdd9 guibg=#57595e guisp=NONE gui=NONE
  hi VimlineExtSeperator guifg=#6cb6eb guibg=#34343c guisp=NONE gui=NONE
  hi VimlineExt guifg=#3e4249 guibg=#6cb6eb guisp=NONE gui=NONE
  hi VimlineErrorSeperator guifg=#ec7279 guibg=#34343c guisp=NONE gui=NONE
  hi VimlineError guifg=#282828 guibg=#ec7279 guisp=NONE gui=NONE
  hi VimlineWarningSeperator guifg=#deb974 guibg=#34343c guisp=NONE gui=NONE
  hi VimlineWarning guifg=#282828 guibg=#deb974 guisp=NONE gui=NONE
  hi link VimlineActiveFileSep VimlineExtSeperator
  hi link VimlineInActiveFileSep VimlineFileSeperator
  hi link VimlineActiveFile VimlineExt
  hi link VimlineInActiveFile VimlineFile
endfunction
