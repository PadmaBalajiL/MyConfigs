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
set nocompatible

" General Settings
set relativenumber
set cc =180
syntax on
" Color schemes
set t_Co=256
filetype on
filetype indent on
filetype plugin on
set clipboard=unnamedplus
" On pressing tab, insert 2 spaces
" set expandtab
" show existing tab with 2 spaces width
" set tabstop=2
" set softtabstop=2
" when indenting with '>', use 2 spaces width
" set shiftwidth=2
" if filereadable(expand("~/.vim/.vimrc.plug"))
"       source ~/.vim/.vimrc.plug
" endif
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-fugitive'
  Plug 'chrisbra/vim-diff-enhanced'  
  Plug 'srcery-colors/srcery-vim'
  Plug 'lucasprag/simpleblack' 
  Plug 'godlygeek/tabular'
  "Plug 'vimwiki/vimwiki'
  Plug 'plasticboy/vim-markdown' 
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
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
  " Plug 'xuhdev/vim-latex-live-preview'
  Plug 'lervag/vimtex'
  Plug 'dpelle/vim-LanguageTool'
  " Plug 'rhysd/vim-grammarous'
  "Plug 'SirVer/ultisnips'
  Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
call plug#end()

colorscheme srcery 
" My Leader !!
let mapleader = "e"
let maplocalleader = "b"

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
:map ss :w<CR>

" ForPio to run
:map <LocalLeader>q :! clear && pio run<Enter> 
:map <LocalLeader>w :! clear && pio run -t upload<Enter> 
" For window change
:map <LocalLeader>h <C-w>h
:map <LocalLeader>j <C-w>j
:map <LocalLeader>k <C-w>k
:map <LocalLeader>l <C-w>l

" VIM completion shortcut
:inoremap <LocalLeader>3  <C-x><C-o>

"Python completor for python 3
let g:pymode_python = 'python3'
let g:pymode = 1
let g:pymode_indent =1
let g:pymode_trim_whitespaces = 1
let g:pymode_options_max_line_length =800 
let g:pymode_preview_height = &previewheight
let g:pymode_options = 1
" Python Auto completor Completor.vim
" let g:completor_python_binary = '/path/to/python/with/jedi/installed'

" ALE options and configuration
let g:ale_sign_error = '--'
let g:ale_sign_warning = '..'
let b:ale_fixers={'cpp':'clangtidy'}

" Airline options
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
:map <Leader>l :buffers<CR>

" Mark down setup
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_math = 1
set conceallevel=2

" Notes mapping
:nnoremap <Leader>nl :e $NOTES_DIR/index.md<CR>cd $Notes_DIR

" Markdown settings
" let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/padmabl/Myconfigs/github-markdown.css'
autocmd FileType markdown normal zR

" Started In Diff-Mode set diffexpr (plugin not loaded yet)
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

" Gutentags for vim
" set statusline+=%{gutentags#statusline()}

" LATEX configurations
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" Snippet configurations
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<c-b>'
"let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

" Grammarous check config
" let g:grammarous#languagetool_cmd = 'languagetool'
" :nmap <F5> (grammarous-move-to-next-error)
" :nmap <F6> (grammarous-open-info-window)

" Language tool
let g:languagetool_jar='/home/padmabl/.vim/plugged/vim-grammarous/misc/LanguageTool-5.0/languagetool-commandline.jar'

" shortcuts for latex
autocmd FileType tex inoremap ;bf \textbf{}<Space><Esc>T{i 
autocmd FileType tex inoremap ;it \textit{}<Space><Esc>T{i 
autocmd FileType tex inoremap ;s \section{}<Space><Esc>T{i 
autocmd FileType tex inoremap ;ch \chapter{}<Space><Esc>T{i 
autocmd FileType tex inoremap ;r \re{}<Space><Esc>T{i 
autocmd FileType tex inoremap ;su \subfile{}<Space><Esc>T{i 
autocmd FileType tex inoremap ;l \label{}<Space><Esc>T{i 
autocmd FileType tex inoremap ;c \caption{}<Space><Esc>T{i 

" Latex environments
autocmd FileType tex inoremap ;fg \begin{figure}[h!]<CR>\caption{}<CR>\label{}<CR>\includegraphics[width=\linewidth]{}\end{figure}<Esc>2k
autocmd FileType tex inoremap ;em \begin{}<CR><CR>\end{} 
autocmd FileType tex inoremap ;ta \begin{table}[h!]<CR>\caption{}<CR>\label{}<CR>\end{table}<Esc>2k
autocmd FileType tex inoremap ;tb \begin{tabular}{p{1cm}p{5cm}}<CR><CR>\end{tabular}<Esc>2k
