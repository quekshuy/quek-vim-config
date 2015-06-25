This is just my vim config that I use for development. 

To install:

_Symbolic link to vim config_

`ln -s /path/to/repo/.vimrc ~/.vimrc`

_Make `~/.vim` directory if not yet created_

`mkdir ~/.vim # if not yet created`

_Put the existing plugins where they belong._

`ln -s /path/to/repo/autoload ~/.vim/autoload`

`ln -s /path/to/repo/plugin ~/.vim/plugin`

Then launch `vim` and `:PlugInstall`.

Enjoy.
