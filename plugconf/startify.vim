let g:startify_enable_special         = 1
let g:startify_files_number           = 8
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1
let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1

let g:startify_list_order = [
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ['   LRU:'],
  \ 'files',
  \ ['   LRU within this dir:'],
  \ 'dir',
  \ ]

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ $VIMRUNTIME .'/doc',
            \ 'bundle/.*/doc',
            \ ]

let g:startify_bookmarks = [
            \ '~/.config/nvim/init.vim',
            \ '~/.config/qtile/config.py',
            \ ]

let g:startify_custom_header =
      \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['']

