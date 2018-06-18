# Neovim config

## Install

Make sure you have [nvim installed](https://github.com/neovim/neovim/wiki/Installing-Neovim).


Install [vim-plug](https://github.com/junegunn/vim-plug#unix-1):

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Pull the repository into `$HOME/.config/nvim` (Debian):

    mkdir -p $HOME/.config/nvim/
    git clone git@github.com:greyblake/dot-nvim.git $HOME/.config/nvim

Enter `nvim` and install plugins:

    :PlugInstall
