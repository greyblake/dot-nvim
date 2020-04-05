" Plugins
call plug#begin('$HOME/.config/nvim/plugged')

" General
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'greyblake/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/lightline.vim'
Plug 'vimlab/split-term.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'jceb/vim-orgmode'

" Markdown
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'dhruvasagar/vim-table-mode'

" HTTP Client
Plug 'baverman/vial'
Plug 'baverman/vial-http'

" Autocomplete (requires python3)
" Plug 'Shougo/deoplete.nvim'
Plug 'greyblake/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-rhubarb'
Plug 'cloudhead/neovim-fuzzy'
Plug 'tpope/vim-abolish'
" Plug 'w0rp/ale'  " Lints

" Snipmate and snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

"HTML
Plug 'mattn/emmet-vim'

"Javscript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'
Plug 'bdauria/angular-cli.vim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'racer-rust/vim-racer'
Plug 'pest-parser/pest.vim'

" Ruby specific
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'sovetnik/vim-hanami'

" Esperanto keyboard
Plug 'greyblake/vim-esperanto'

call plug#end()




filetype plugin indent on

" Custom settings
syntax on
set number
set backspace=indent,eol,start  "To make backspace work in normal way
set spell
set expandtab
set splitright
set splitbelow

" Indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set nowrap

" Load ftplugins and indent files
filetype plugin on
filetype indent on

" SWAP files
set dir=$HOME/.nvim/tmp

" Neomake
let g:neomake_make_modified=1
let g:neomake_verbose=0
autocmd! BufWritePost * Neomake
autocmd! InsertLeave * Neomake

" Set Solarized color scheme
set background=dark
colorscheme solarized


" Mappings
nmap <silent> <Leader>p :NERDTreeToggle<CR>

" Bubble selection (it depends on unimpaired plugin)
nmap <C-k> [e
nmap <C-Up> [e
nmap <C-j> ]e
nmap <C-Down> ]e
vmap <C-k> [egv
vmap <C-Up> [egv
vmap <C-j> ]egv
vmap <C-Down> ]egv

" Emacs like shortcuts for insert mode
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-e> <End>
imap <C-a> <Esc>I
imap <C-k> <Esc>c$
imap <C-u> <Esc>c^<del>
imap <A-b> <Esc>bi
imap <A-f> <Esc>ea
" Also need to process "|"
let chars = [' ', '!', '"', '#', '$', '%', '&', "'", '(', ')', '*', '+', ',', '-', '.', '/', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ':', ';', '<', '=', '>', '?', '@', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '[', '\', ']', '^', '_', '`', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '}', '~']
for c in chars
   if c == ' '
       let key = '<Space>'
   else
       let key = c
   endif
   exe 'imap <C-]>' . key . ' <Esc>f' . c . 'i'
   exe 'imap <C-A-]>' . key . ' <Esc>F' . c . 'i'
endfor

" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Work around to set colorscheme for GUI
function! s:setColorScheme(job_id, data, event)
  colorscheme solarized
endfunction
let s:callbacks = {
\ 'on_stdout': function('s:setColorScheme'),
\ 'on_stderr': function('s:setColorScheme'),
\ 'on_exit': function('s:setColorScheme')
\ }
call jobstart(['bash', '-c', 'sleep 0.1'], extend({'shell': 'shell 2'}, s:callbacks))

" Customize Hanami plugin
let g:hanami_open_strategy = 'vsplit'

" Activate Angular plugin
autocmd VimEnter * if globpath('.,..','node_modules/@angular') != '' | call angular_cli#init() | endif

" Configure ALE lints
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'rust': ['cargo', 'rustfmt']
\}


" For vim-markdown-preview plugin
let vim_markdown_preview_github=1
