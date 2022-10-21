set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set encoding=UTF-8
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set list
set lcs+=space:·

call plug#begin()
 " Plugins
 Plug 'morhetz/gruvbox'
 Plug 'scrooloose/nerdtree'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'simrat39/rust-tools.nvim'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
 " Plug 'ryanoasis/vim-devicons' <- Doesn't work properly on WSL :(
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italic = 0
colorscheme gruvbox
" colorscheme moonlight2

set splitright
set splitbelow

" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
command Tsc cd Src/ && tsc

" Split pane navigation
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

nnoremap <C-H> <C-w>h
nnoremap <C-J> <C-w>j
nnoremap <C-K> <C-w>k
nnoremap <C-L> <C-w>l

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

nnoremap <C-o> <cmd>Telescope find_files<cr>
nnoremap <C-t> <cmd>tabnew<cr>
nnoremap <C-l> <cmd>tabn<cr>
nnoremap <C-h> <cmd>tabp<cr>

inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv



