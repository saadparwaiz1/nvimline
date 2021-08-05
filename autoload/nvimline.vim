function! nvimline#highlight() abort
  " Modes Highlights
  highlight VimlineModeR guifg=#282828 guibg=#deb974 guisp=NONE gui=bold
  highlight VimlineModeT guifg=#282828 guibg=#6cb6eb guisp=NONE gui=bold
  highlight VimlineModeC guifg=#282828 guibg=#d38aea guisp=NONE gui=bold
  highlight VimlineModeV guifg=#282828 guibg=#ec7279 guisp=NONE gui=bold
  highlight VimlineModeI guifg=#282828 guibg=#6cb6eb guisp=NONE gui=bold 
  highlight VimlineModeN guifg=#282828 guibg=#a0c980 guisp=NONE gui=bold 
  highlight VimlineSeperatorT guifg=#6cb6eb guibg=#34343c guisp=NONE gui=NONE
  highlight VimlineSeperatorV guifg=#ec7279 guibg=#34343c guisp=NONE gui=NONE
  highlight VimlineSeperatorI guifg=#6cb6eb guibg=#34343c guisp=NONE gui=NONE
  highlight VimlineSeperatorR guifg=#deb974 guibg=#34343c guisp=NONE gui=NONE
  highlight VimlineSeperatorC guifg=#d38aea guibg=#34343c guisp=NONE gui=NONE
  highlight VimlineSeperatorN guifg=#a0c980 guibg=#34343c guisp=NONE gui=NONE
  " File
  highlight VimlineFile guifg=#282828 guibg=#c5cdd9 guisp=NONE gui=NONE
  highlight VimlineFileSeperator guifg=#c5cdd9 guibg=#34343c guisp=NONE gui=NONE
  " Git
  highlight VimlineGit guifg=#282828 guibg=#d38aea guisp=NONE gui=NONE
  highlight VimlineGitSeperator guifg=#d38aea guibg=#34343c guisp=NONE gui=NONE
  " Line
  highlight VimlineLine guifg=#c5cdd9 guibg=#57595e guisp=NONE gui=NONE
  highlight VimlineSubStatusLine guifg=NONE guibg=NONE guisp=NONE gui=NONE
  highlight VimlineLineSeperator guifg=#57595e guibg=#34343c guisp=NONE gui=NONE
  " Active File
  highlight VimlineActiveFile guifg=#3e4249 guibg=#6cb6eb guisp=NONE gui=NONE
  highlight VimlineActiveFileSep guifg=#6cb6eb guibg=#34343c guisp=NONE gui=NONE
  " Highlight Links
  highlight link VimlineInActiveFile VimlineFile
  highlight link VimlineInActiveFileSep VimlineFileSeperator
endfunction
