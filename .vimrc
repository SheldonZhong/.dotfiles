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
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" you complete me use clangd
let g:ycm_clangd_binary_path = "/usr/bin/clangd"

let g:airline_powerline_fonts = 1
highlight! link SignColumn LineNr

" ctrlp seems working without explicit map
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

set ignorecase
set smartcase
set number
set relativenumber
set hlsearch
" been set in defaults.vim
" set incsearch
"
set shortmess-=S

" rendering whitespace
" set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
" set list

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set laststatus=2

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
