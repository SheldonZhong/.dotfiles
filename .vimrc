unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
" unlet_skip_defaults loads /etc/vimrc
" /etc/vimrc -> runtime! archlinux.vim
" it loads /usr/share/vim/vimfiles/archlinux.vim
" source loads /usr/share/vim/vim82/defaults.vim

" vundle plugin manager
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lervag/vimtex'
Plugin 'JamshedVesuna/vim-markdown-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

" you complete me use clangd
let g:ycm_clangd_binary_path = "/usr/bin/clangd"

let g:airline_powerline_fonts = 1
highlight! link SignColumn LineNr

" show buffer at the top
let g:airline#extensions#tabline#enabled = 1

" ctrlp seems working without explicit map
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['tag']

set ignorecase
set smartcase
set wildignorecase
set number
set relativenumber
set hlsearch
set autoread
" been set in defaults.vim
set incsearch
set linebreak

" show search count
set shortmess-=S

" rendering whitespace
" set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
" set list

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" always show status
set laststatus=2

set background=dark

" markdown preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_use_xdg_open=1
let vim_markdown_preview_perl=1

" automatically close preview
let g:ycm_autoclose_preview_window_after_completion = 1

" don't automatically popup YCM doc
let g:ycm_auto_hover = ''

" default vimtex viewer
" evince is better than zathura on wayland
" let g:vimtex_view_method='zathura'
let g:vimtex_view_forward_search_on_start=0
" ignore warnings
" :copen/cclose to show/supress the warnings
let g:vimtex_quickfix_open_on_warning = 0

" default if vim can't guess correctly
let g:tex_flavor='latex'

" toggle YCM documentation
nmap <leader>D <plug>(YCMHover)
nmap ,d :b#<bar>bd#<CR>
set nostartofline

" Gtags shortcut
nnoremap <C-\> :GtagsCursor<CR>

" more convenient windows navigation
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" avoid typing ENTER after reading man page
nnoremap K K<CR>

" jump out of brackets (for the most time) using <Ctrl-E>
inoremap <C-E> <C-O>A

" use Ctrl + S to save in normal mode
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

" Use Ctrl +S to save in insert mode
inoremap <C-S> <ESC>:<C-u>Update<CR>

set clipboard^=unnamed,unnamedplus
