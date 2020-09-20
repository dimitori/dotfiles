" redefine leader
nnoremap <SPACE> <Nop>

"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'


"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

"Utils
Plugin 'tpope/vim-commentary'
"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"auto-completion stuff
"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'python-rope/ropevim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'

"JS
 Plugin 'neoclide/coc.nvim', {'branch': 'release'}
 let g:coc_global_extensions = [
 	\ 'coc-snippets',
 	\ 'coc-pairs',
 	\ 'coc-tsserver',
 	\ 'coc-eslint',
 	\ 'coc-emmet',
 	\ 'coc-css',
 	\ 'coc-html',
 	\ 'coc-json',
 	\ 'coc-prettier',
 	\ 'coc-vetur'
 	\ ]
Plugin 'mattn/emmet-vim'
let g:user_emmet_leader_key='<C-Z>'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'posva/vim-vue'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'ap/vim-css-color'
Plugin 'morhetz/gruvbox'


"Cosmetic
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
call vundle#end()

"  Plugins variables
filetype plugin indent on    " required
let g:SimpylFold_docstring_preview = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_filetype_whitelist = {'*.py': 1}

"custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <silent> <Leader>f :YmcCompleter FixIt<CR>
"
call togglebg#map("<F5>")
"colorscheme zenburn
" colorscheme solarized
" colorscheme dracula
colorscheme gruvbox

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complet
"python with virtualenv support
python3 << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------




" MY SETTINGS -----------------------------------------------
set nu  " always show current line number
set relativenumber
set smartcase  " better case-sensitivity when searching
set wrapscan  " begin search from top of file when nothign is found anymore
set laststatus=2  " always slow statusline


" Mode Settings
set mouse=a  " change cursor per mode
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za


set background=dark

" tabs:
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

imap jj <Esc>

map tt :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>
map s $
map S ^
"  copy to clipboard
vmap Y "+y 
map J 5j
map K 5k
nnoremap <F3> :tabnew $MYVIMRC<CR>
nnoremap <F1> :set invpaste paste?<CR>
set pastetoggle=<F1>
set showmode

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


"  To avoid extraneous whitespaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


"I don't like swap files
set noswapfile


function! NERDTreeToggleInCurDir()                                                                                                                                                             
·   " If NERDTree is open in the current buffer
·   if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
·   ·   exe ":NERDTreeClose"
·   else
·   ·   if (expand("%:t") != '')
·   ·   ·   exe ":NERDTreeFind"
·   ·   else
·   ·   ·   exe ":NERDTreeToggle"
·   ·   endif
·   endif
endfunction

let g:ycm_filetype_blacklist = { 'ts': 1, 'js': 1 }

" Remap for rename current word
" nmap <F2> <Plug>(coc-rename)

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab
