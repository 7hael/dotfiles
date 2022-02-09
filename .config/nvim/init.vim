let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "hard"

colo gruvbox
" Enables syntax highlighting
syntax on

" set nomodeline
" set nocompatible
" filetype off

set encoding=utf-8
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Syntax and tools
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'w0rp/ale'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'tpope/vim-fugitive'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'tpope/vim-surround'

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set hlsearch
"set showcmd		" Show (partial) command in status line.\
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set linebreak       " Break lines before/after words
set hidden  		" Hide buffers when they are abandoned
set mouse=a	    	" Enable mouse usage (all modes)
set number	    	" Enable line numbers
set cursorline		" Highlight cursor line
set relativenumber	" Enable relative line numbers
set smarttab        " Enable smart tabbing
set tabstop=4       " Makes tabs appear 4 spaces wide
set shiftwidth=4	" Makes indents appear 4 spaces wide

" setlocal spell
" set spelllang=it,en_gb

" Use system clipboard
set clipboard=unnamedplus

" Pair completion
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [[
inoremap []     []

" GUI settings
let g:neovide_refresh_rate=90
let g:neovide_fullscreen=v:true

let g:neovide_cursor_animation_length=0.10
