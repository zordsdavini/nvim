" ViM config by zordsdavini, 2018
"=================================

" be iMproved
set nocompatible 	

" Declare the general config group for autocommand
augroup vimrc
  autocmd!
augroup END


"-----------------
" install plugin
"-----------------

let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

" wrapper for git and display git diff in the left gutter
Plug 'tpope/vim-fugitive' | Plug 'mhinz/vim-signify' 

" colors
Plug 'tpope/vim-vividchalk'



call plug#end()

"----------------
" plugin config
"----------------



"------------------
" general binding
"------------------
syntax on

let mapleader = "\\"

" un-highlight when esc is pressed
map <silent><esc> :noh<cr>

" surround by quotes - frequently use cases of vim-surround
map <leader>" ysiw"<cr>
map <leader>' ysiw'<cr>

" Nice vertical line
set fillchars+=vert:│
autocmd ColorScheme * hi VertSplit cterm=NONE ctermfg=Blue ctermbg=NONE guifg=Blue guibg=NONE gui=NONE

" Add color for 131 column (warning for overline)
autocmd ColorScheme * hi ColorColumn ctermbg=8 guibg=#333333
set colorcolumn=130

"Fast reloading of the init.vim
map <leader>s :source ~/.vimrc<cr>
"Fast editing of init.vim
map <leader>e :e! ~/.vimrc<cr>

"Copy relative path into clipboard
nmap <leader>p :let @+ = expand("%")<cr> :let @" = expand("%")<cr>

" delete trailing space when saving files
autocmd vimrc BufWrite *.php,*.js,*.jsx,*.vue,*.twig,*.html,*.sh,*.yaml,*.yml sf:call general#DeleteTrailingWS()


"-----------------
" general config 
"-----------------

" colorscheme
colo vividchalk
set background=dark

" Directories for swp files
set backup
set backupdir=~/.vim/backup
set noswapfile

" set line number
set number
set numberwidth=6

" number of undo saved in memory
set undolevels=10000 " How many undos
set undoreload=10000 " number of lines to save for undo

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" enable the mouse
set mouse=a

" Better ex autocompletion
set wildmenu
set wildmode=list:longest,full

" don't wrap lines
set nowrap

" write automatically when quitting buffer
set autowrite
