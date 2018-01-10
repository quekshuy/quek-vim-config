This is just my vim/neovim config that I use for development. 

To install:

_Symbolic link to vim config and vim directory_

```bash
ln -s /path/to/repo/.vimrc ~/.vimrc
```

```bash
ln -s /path/to/repo ~/.vim
```

## (Optional) for neovim

```bash
ln -s /path/to/repo ~/.config/nvim
```

```bash
ln -s /path/to/repo/.vimrc ~/.config/nvim/init.vim
```

Then launch `vim` (or `nvim`) and `:PlugInstall`.

Enjoy.
