# Neovim config

## Requirements

- **Neovim** ≥ 0.11.7 (0.12.x recommended — needed by `nvim-telescope/telescope.nvim`
  and by the `main` branch of `nvim-treesitter`).
- **git**, **curl**, **tar** — used by plug.vim and nvim-treesitter to fetch
  plugins and parser sources.
- **A C compiler** (`gcc` or `cc`) — needed to build treesitter parsers.
- **[`tree-sitter` CLI](https://github.com/tree-sitter/tree-sitter)** ≥ 0.26.1 —
  required by nvim-treesitter's `main` branch to compile parsers.
  Install via `npm i -g tree-sitter-cli` or `cargo install tree-sitter-cli`.
- **Node.js / npm** — needed by `coc.nvim` and by CoC language extensions.
- **ripgrep** (`rg`) — powers Telescope's `live_grep` (`<C-s>`).
- **fd** (optional) — speeds up Telescope's `find_files`.
- **Python 3** and **pynvim** (`pip install pynvim`) — for plugins that shell
  out to Python.

## Install

Install [vim-plug](https://github.com/junegunn/vim-plug#unix-1):

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Pull the repository into `$HOME/.config/nvim` (Debian):

    mkdir -p $HOME/.config/nvim/
    git clone git@github.com:greyblake/dot-nvim.git $HOME/.config/nvim

Enter `nvim` and install plugins:

    :PlugInstall

Install the treesitter parsers you actually use (examples):

    :lua require('nvim-treesitter').install({ 'rust', 'lua', 'vim', 'vimdoc', 'bash', 'markdown', 'markdown_inline', 'roc', 'wit' }):wait(300000)

## Extra dependencies

For clipboard:

    sudo apt install xsel xclip wl-clipboard

For fuzzy-file search (`<C-f>`) and live grep (`<C-s>`):

    sudo apt install ripgrep fd-find

## Key mappings

- `<C-f>` — Telescope `find_files` (fuzzy file name search).
- `<C-s>` — Telescope `live_grep` (ripgrep across the project).
- Inside Telescope pickers: `<CR>` open, `<C-t>` new tab, `<C-v>` vsplit,
  `<C-x>` hsplit, `<C-q>` send to quickfix.
