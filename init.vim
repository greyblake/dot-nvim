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
Plug 'atiladefreitas/dooing'

" Plug 'rafi/awesome-vim-colorschemes'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'jceb/vim-orgmode'
Plug 'mustache/vim-mustache-handlebars'
Plug 'gyim/vim-boxdraw'
Plug 'preservim/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'

" Theme
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'joshdick/onedark.vim'
Plug 'Mofiqul/vscode.nvim'
" Plug 'Mofiqul/dracula.nvim'
Plug 'romgrk/doom-one.vim'
Plug 'tomasiser/vim-code-dark'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode'
Plug 'sotte/presenting.vim'  " Presentation

" HTTP Client
" Plug 'baverman/vial'
" Plug 'baverman/vial-http'

" Autocomplete (requires python3)
" Plug 'Shougo/deoplete.nvim'
"Plug 'greyblake/vim-colors-solarized'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-rhubarb'
" Plug 'cloudhead/neovim-fuzzy'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'lotabout/skim.vim'
Plug 'tpope/vim-abolish'
" Plug 'w0rp/ale'  " Lints

" Snipmate and snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

"HTML
Plug 'mattn/emmet-vim'
" Plug 'barrett-ruth/live-server.nvim'

"Javscript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi' " Autocomplete for TS
Plug 'posva/vim-vue'
Plug 'bdauria/angular-cli.vim'

" Rescript
Plug 'rescript-lang/vim-rescript'

" Roc
Plug 'ChrisWellsWood/roc.vim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'pest-parser/pest.vim'

" Solidity (Ethereum)
Plug 'tomlion/vim-solidity'

" Collection of common configurations for the Nvim LSP client
" Plug 'neovim/nvim-lspconfig'

" Extensions to built-in LSP, for example, providing type inlay hints
" Plug 'tjdevries/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

" Diagnostic navigation and settings for built-in LSP
Plug 'nvim-lua/diagnostic-nvim'


" Ruby specific
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'sovetnik/vim-hanami'

" Idris
" Plug 'edwinb/idris2-vim'

" PlantUML
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'

" Vim Wiki
" Plug 'vimwiki/vimwiki'

" Esperanto keyboard
Plug 'greyblake/vim-esperanto'

" Justfile
Plug 'NoahTheDuke/vim-just'

" C# / OmniSharp
Plug 'OmniSharp/omnisharp-vim'



Plug 'github/copilot.vim'

" Plug 'neoclide/coc.nvim', {'branch': 'v0.0.80'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

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
set shiftwidth=4
set softtabstop=4
" set expandtab
" set autoindent
" set nowrap

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
" colorscheme solarized8
colorscheme gruvbox8
" colorscheme codedark


" Mappings
nmap <silent> <Leader>p :NERDTreeToggle<CR>

" Fuzzy search with skim (sk)
nmap <C-f> :Files<CR>

" Search with ripgrep
nmap <C-s> :Rg<Cr>

" Toggle tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=60
" Special mapping for .tsx
let g:tagbar_type_typescriptreact = {
\ 'ctagstype': 'typescript',
\ 'kinds': [
  \ 'c:class',
  \ 'n:namespace',
  \ 'f:function',
  \ 'G:generator',
  \ 'v:variable',
  \ 'm:method',
  \ 'p:property',
  \ 'i:interface',
  \ 'g:enum',
  \ 't:type',
  \ 'a:alias',
\ ],
\'sro': '.',
  \ 'kind2scope' : {
  \ 'c' : 'class',
  \ 'n' : 'namespace',
  \ 'i' : 'interface',
  \ 'f' : 'function',
  \ 'G' : 'generator',
  \ 'm' : 'method',
  \ 'p' : 'property',
  \},
\ }

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


" Use the old verison of snipmate parser
let g:snipMate = { 'snippet_version' : 0 }


" Configure LSP for rust-analyzer
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

source ~/.config/nvim/coc_mappings.vim


" " Vim-Script:
" " For dark theme
" let g:vscode_style = "dark"
" " For light theme
" " let g:vscode_style = "light"
" " Enable transparent background.
" let g:vscode_transparency = 1
" " Enable italic comment
" let g:vscode_italic_comment = 1
" " Disable nvim-tree background color
" let g:vscode_disable_nvimtree_bg = v:true
" colorscheme dracula

nmap <C-a> :CocAction<CR>

" Rust: macro expand
" 1) Open a new buffer
" 2) Run expandMacro
" 3) Set filetype=rust for proper syntax highlighting
nmap me :split<CR> :CocCommand rust-analyzer.expandMacro<CR> :set filetype=rust<CR>
