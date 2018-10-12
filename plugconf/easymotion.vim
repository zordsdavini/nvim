" Set colors for vim-easymotion
hi EasyMotionTarget2First ctermbg=none ctermfg=blue cterm=bold
hi EasyMotionTarget2Second ctermbg=none ctermfg=blue cterm=bold

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

