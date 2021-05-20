set nocompatible
set encoding=utf-8

" Sets the amount of history
set history=500

" Enable filetype plugins 
filetype plugin on
filetype indent on

set tabstop=2
set shiftwidth=2
set expandtab

" Hybrid style relative line numbers
set number relativenumber

" Turn on the Wild menu
set wildmenu

" Turn on the ruler
set ruler

" Turn on search
set hlsearch

" Search like modern browsers
set incsearch 

" Move screen when 7 lines away from edge
set scrolloff=7

" For faster completions and better user experience, decrease updatetime
" from 4000ms to 300ms.
set updatetime=300
  
set backupcopy=yes

" Add highlighting for column 81 for formatting purposes.
set colorcolumn=81
highlight ColorColumn ctermbg=magenta

" Turn on smartcase, only use case sensitive search if there's an uppercased
" letter.
set ignorecase
set smartcase

" Set background to dark to make colors easier to see.
set background=dark

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/ctrlp.vim'
call plug#end()

map <C-n> :NERDTreeToggle<CR>

" CoC config
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


inoremap jj <esc>
inoremap kj <esc>
inoremap jk <esc>
inoremap kk <esc>
