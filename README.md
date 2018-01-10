This is just my vim config that I use for development. 

To install:

_Symbolic link to vim config_

`ln -s /path/to/repo/.vimrc ~/.vimrc`

_Symbolic link to vim folder_

`ln -s /path/to/repo ~/.vim`

_Put the existing plugins where they belong._

`ln -s /path/to/repo/autoload ~/.vim/autoload`

`ln -s /path/to/repo/plugin ~/.vim/plugin`

Then launch `vim` and `:PlugInstall`.

For neovim,

_Symbolic link init.vim which is used by neovim_

`ln -s /path/to/repo/.vimrc /path/to/repo/init.vim`


Enjoy.
