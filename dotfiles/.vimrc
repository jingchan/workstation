set nocompatible

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

" Add autocompletion
set omnifunc=syntaxcomplete#Complete
  
set backupcopy=yes

set colorcolumn=80

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'Valloric/YouCompleteMe'
call plug#end()

map <C-n> :NERDTreeToggle<CR>

" Enhance YCM JS complete with tern
autocmd FileType javascript setlocal omnifunc=tern#Complete
set completeopt-=preview
