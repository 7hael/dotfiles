" Plugins
call plug#begin()
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ellisonleao/gruvbox.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'simrat39/rust-tools.nvim'
call plug#end()

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set hlsearch
"set showcmd		" Show (partial) command in status line.\
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set linebreak       " Break lines before/after words
set hidden  		" Hide buffers when they are abandoned
set mouse=a	    	" Enable mouse usage (all modes)
set number	    	" Enable line numbers
set cursorline		" Highlight cursor line
set relativenumber	" Enable relative line numbers
set smarttab        " Enable smart tabbing
set tabstop=4       " Makes tabs appear 4 spaces wide
set shiftwidth=4	" Makes indents appear 4 spaces wide

" Use system clipboard
set clipboard=unnamedplus

let mapleader = " "
" Pair completion
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [[
inoremap []     []

" nvim-tree
:lua require('plugins/tree')
:lua require('plugins/tree-autoclose')
map <C-t> :NvimTreeToggle <CR>

" nvim-gruvbox
:lua require('plugins/gruvbox')
set encoding=utf-8
set background=dark
colorscheme gruvbox

" nvim-treesitter
:lua require('plugins/treesitter')

" nvim-telescope
:lua require('plugins/telescope')

" nvim-cmp
:lua require('plugins/cmp')

" rust-tools 
:lua require('plugins/rust-tools')
