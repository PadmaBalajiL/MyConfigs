" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
" runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" let mapleader =","
" set nocompatible

" General Settings
set relativenumber
set cc =80
syntax on
set undofile
set undodir=~/padmabl/.vim/undo
set t_Co=256
filetype on
filetype indent on
filetype plugin on
set clipboard=unnamedplus
" if filereadable(expand("~/.vim/.vimrc.plug"))
" 	source ~/.vim/.vimrc.plug
" endif
call plug#begin('~/.vim/plugged')
  "Plug 'itchyny/lightline.vim'
  Plug 'dense-analysis/ale'
  Plug 'Chiel92/vim-autoformat'
  "Plug 'scrooloose/nerdcommenter'
  "Plug 'scrooloose/nerdtree'
  "Plug 'maralla/completor.vim'
  Plug 'rapphil/vim-python-ide'
  " Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  "Plug 'xuhdev/vim-latex-live-preview'
  "Plug 'lervag/vimtex'
call plug#end()

" My Leader !!
let mapleader = "e"
let maplocalleader = "z"

" Key mapping for vim-autoformat
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

autocmd FileType python inoremap <LocalLeader>c '''<CR><Tab>Return type --><CR>parameters--> <CR>'''<CR>
let g:autoformat_verbosemode=1

" Nerd commenter config
let g:NERDCompactSexyComs = 1

" NerdTree configs
":map <C-n> :NERDTreeToggle<CR>
"let NERDTreeIgnore=['\.pyc$', '\~$']
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

" USEFUL KEY MAPPINGS
:inoremap qq <Esc>
:map aa :w<CR>
" For Pio to run
:map <LocalLeader>q :! clear && pio run<Enter> 
:map <LocalLeader>w :! clear && pio run -t upload<Enter> 
" For window change
:map <LocalLeader>h <C-w>h
:map <LocalLeader>j <C-w>j
:map <LocalLeader>k <C-w>k
:map <LocalLeader>l <C-w>l
"Python completor for python 3
let g:pymode_python = 'python3'
let g:pymode = 1
let g:pymode_indent =1
let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length = 480
let g:pymode_preview_height = &previewheight
let g:pymode_options = 1
" Python Auto completor Completor.vim
" let g:completor_python_binary = '/path/to/python/with/jedi/installed'

" ALE options and configuration
let g:ale_sign_error = '--'
let g:ale_sign_warning = '..'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'


" Buffer key bindings
:map <Leader>1 :buffer 1<CR>
:map <Leader>2 :buffer 2<CR>
:map <Leader>3 :buffer 3<CR>
:map <Leader>4 :buffer 4<CR>
:map <Leader>5 :buffer 5<CR>
:map <Leader>6 :buffer 6<CR>
:map <Leader>7 :buffer 7<CR>
:map <Leader>8 :buffer 8<CR>
:map <Leader>9 :buffer 9<CR>
:map <Leader>10 :buffer 10<CR>
:map <Leader>11 :buffer 11<CR>

