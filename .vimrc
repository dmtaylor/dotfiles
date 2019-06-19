" Dave's vimrc

set nocompatible

" Plugin section
"
let usePlugins = 1
if usePlugins == 1
    filetype off " disable for running plugins

    " Vundle section
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'gcmt/taboo.vim'
    Plugin 'kshenoy/vim-signature'
    Plugin 'tpope/vim-eunuch'
    Plugin 'tpope/vim-commentary'
    Plugin 'tpope/vim-capslock'
    Plugin 'junegunn/goyo.vim'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'vim-scripts/cream-showinvisibles'
    Plugin 'mileszs/ack.vim'
    Plugin 'sjl/gundo.vim'

    call vundle#end()
    "end vundle section
    " open ack.vim
    nnoremap <leader>a :Ack
    " gundo
    nnoremap <leader>u :GundoToggle<CR>

    " taboo tab naming section
    let g:taboo_tab_format=" %N %f%m "

endif

filetype indent plugin on
syntax on

colorscheme elflord
set shiftwidth=4
set tabstop=4
set expandtab
set relativenumber
set number
set ruler
set wrap
set showcmd

" set list " Show trailing whitespace
set listchars=trail:.
set ignorecase " Case insensitive unless there's a capital
set smartcase

set cursorline

set autoindent
set smartindent

set backspace=indent,eol,start

set cmdheight=2
set visualbell
set confirm
set scrolloff=5

" Reconfig max tabbed pages
if &tabpagemax < 50
  set tabpagemax=50
endif

" experimental options
set showmatch " match parens
set lazyredraw
set wildmenu
set cursorline " highlight current line

let g:is_posix = 1 " non-posix highlighting
" leader space to unhighlight searches
nnoremap <leader><space> :nohlsearch<CR>
" save session
nnoremap <leader>s :mksession<CR>

" Delete all local marks
nnoremap <leader>d :delmarks a-z<CR> :e<CR>

" Map CTL-Space to esc
inoremap <C-Space> <Esc>

"" set folds
"set nofoldenable
"set foldnestmax=10
"nnoremap <space> za
"set foldmethod=syntax

" move virtual lines
nnoremap j gj
nnoremap k gk

" Status line config
"set ls=2
"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%y%=%{v:register}   " Current register
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor

set ls=2
set statusline=
set statusline +=\ %n\ %*            "buffer number
set statusline +=%{&ff}%*            "file format
set statusline +=%y%*                "file type
set statusline +=\ %<%F%*            "full path
set statusline +=%m%*                "modified flag
set statusline +=%y%=%{v:register}   " Current register
set statusline +=%=%5l%*             "current line
set statusline +=/%L%*               "total lines
set statusline +=%4v\ %*             "virtual column number
set statusline +=0x%04B\ %*          "character under cursor

hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

"hi User1 ctermfg=#eea040 ctermbg=235
"hi User2 ctermfg=#dd3333 ctermbg=235
"hi User3 ctermfg=#ff66ff ctermbg=235
"hi User4 ctermfg=#a0ee40 ctermbg=235
"hi User5 ctermfg=255 ctermbg=235

" Experimental relative line numbering


function! NumberToggle()
	  if(&relativenumber == 1)
	      set number
	  else
		  set relativenumber
	  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

