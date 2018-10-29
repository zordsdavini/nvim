" ViM config by zordsdavini, 2018
"=================================

" be iMproved
set nocompatible 	

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

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" show marks
Plug 'kshenoy/vim-signature'

" Nerdtree + modifications 
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind']}

" undo tree
Plug 'sjl/gundo.vim'

" Display commits for project / file
Plug 'junegunn/gv.vim'

" surrounding with whatever you want (paranthesis, quotes...)
Plug 'tpope/vim-surround'

" the . command can repeat whatever you want!
" http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
Plug 'tpope/vim-repeat'

" comment automatically
Plug 'tpope/vim-commentary'

" swap arguments in parenthesis
Plug 'machakann/vim-swap'

" add new text object (can delete between comma with di, for example)
Plug 'wellle/targets.vim'

" camel case motion
Plug 'chaoren/vim-wordmotion'

" Match more stuff with % (html tag, LaTeX...)
Plug 'andymass/vim-matchup'

" vim project for one specific vimrc / project + startify for startup cow
Plug 'amiorin/vim-project'
Plug 'mhinz/vim-startify'

" general quality tools 
"Plug 'neomake/neomake'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" markdown - writing
Plug 'gabrielelana/vim-markdown' " markdown plugin
Plug 'SidOfc/mkdx', { 'for': 'markdown' } " lot of keystroke for markdown

Plug 'junegunn/goyo.vim', { 'for': 'markdown' } " Distraction-free
Plug 'junegunn/limelight.vim', { 'for': 'markdown' } " Hyperfocus-writing

" nginx
Plug 'chr4/nginx.vim'

" php
Plug 'joonty/vdebug'
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'nishigori/vim-php-dictionary', {'for': 'php'}

" php refactoring options
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug '2072/php-indenting-for-vim', {'for': 'php'}

" php doc autocompletion
Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'}

" autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'phpactor/ncm2-phpactor'
Plug 'ncm2/ncm2-go'
Plug 'ncm2/ncm2-tern'
" Plug 'ncm2/ncm2-tagprefix'

" golang development
Plug 'fatih/vim-go', {'for': 'go'} " general plugin
Plug 'godoctor/godoctor.vim', {'for': 'go'} " refactoring
Plug 'sebdah/vim-delve', {'for': 'go'} " debugger
Plug 'buoto/gotests-vim', {'for': 'go'}

" twig
Plug 'lumiliet/vim-twig', {'for': 'twig'}

" javascript plugins
Plug 'pangloss/vim-javascript'

" For react
Plug 'mxw/vim-jsx'

" outliner
Plug 'majutsushi/tagbar'

" fzf - poweful fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" display the hexadecimal colors - useful for css and color config
Plug 'ap/vim-css-color'

" jump easielly
Plug 'easymotion/vim-easymotion'

" Split arrays in PHP / struct in Go
Plug 'AndrewRadev/splitjoin.vim'


call plug#end()

"----------------
" plugin config
"----------------

" Declare the general config group for autocommand
augroup vimrc
  autocmd!
augroup END


" source every plugin configs
for file in split(glob("~/.vim/plugconf/*.vim"), '\n')
    exe 'source' file
endfor

if exists("g:did_load_filetypes")
  filetype off
  filetype plugin indent off
endif
set rtp+=~/nvim/godoctor.vim
filetype on
filetype plugin indent on

" Autocompletion with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" project config - is not on my git repository
source ~/.vim/projects.vim

" Twig
autocmd vimrc BufNewFile,BufRead *.twig set filetype=html.twig

" Yaml
autocmd vimrc BufNewFile,BufRead *.yml.dist set filetype=yaml.


"------------------
" general binding
"------------------

"" Encoding
set encoding=utf-8
set ttyfast

syntax on

let mapleader = "\\"

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
map <leader>s :source $MYVIMRC<cr>
"Fast editing of init.vim
map <leader>e :e! $MYVIMRC<cr>

"Copy relative path into clipboard
nmap <leader>p :let @+ = expand("%")<cr> :let @" = expand("%")<cr>

" delete trailing space when saving files
autocmd vimrc BufWrite *.php,*.js,*.jsx,*.vue,*.twig,*.html,*.sh,*.yaml,*.yml sf:call general#DeleteTrailingWS()


"-----------------
" general config 
"-----------------

function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction

" colorscheme
colo vividchalk
set background=dark
if has("gui_running")
    " by default, hide gui menus
    set guioptions=I
    map <F11> <Esc>:call ToggleGUICruft()<cr>
endif

" Directories for swp files
set backup
set backupdir=~/.vim/backup
set directory=/tmp

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

" don'tN4 wrap lines
set nowrap

" write automatically when quitting buffer
set autowrite

" favorite filetypes
set ffs=unix,dos,mac


