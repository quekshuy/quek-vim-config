This is just my vim config that I use for development. 

To install:

Symbolic link to vim config
`ln -s /path/to/repo/.vimrc ~/.vimrc`

Make `~/.vim` directory if not yet created
`mkdir ~/.vim # if not yet created`

Put the existing plugins where they belong.
`ln -s /path/to/repo/autoload ~/.vim/autoload`
`ln -s /path/to/repo/plugin ~/.vim/plugin`

Then launch `vim` and `:PlugInstall`.

Enjoy.
