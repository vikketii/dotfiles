syntax on
set showcmd

" set term=screen-256color
set t_ut=


" set background=dark
" colorscheme atom-dark-256

" set guifont=Inconsolata

" show line number and line at right
set number
" set colorcolumn=90

" set leaderkey to space and disable forward
"let mapleader=" "
map <space> <leader>
" nnoremap <SPACE> <Nop>

" update vimrc settings with leaderkey + s
map <leader>s :source ~/.vimrc<CR>

" more info in memory
set hidden
set history=100

" indent settings
filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" highlighted search
set hlsearch
" cancel search with leader + 'x'
nnoremap <silent> <leader>x :nohlsearch<Bar>:echo<CR>

" insert newline without insert mode
nmap <leader>o o<Esc>
nmap <leader>O O<Esc>

" enable all python-syntax highlighting
" let g:python_highlight_all = 1

" enable hybrid line numbers with autotoggling
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Natural split opening
set splitbelow
set splitright
