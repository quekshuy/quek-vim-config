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

Then launch `vim` (or `nvim`) and `:PlugInstall`.

Also recommended you install the python client for neovim. We use an autocompletion plugin called deoplete that requires it.

```
brew install python3
pip3 install neovim
```

_Note:_
If you install miniconda, it will install its own copy of Python. Be sure to pip-install `neovim` again again.

## (Optional) for Oni

Oni might not be able to find your (custom) installation of Python3. Configure Oni with

```javascript
"environment.additionalPaths": [
  // Custom path(s)
  "/path/to/python3",

  // the below are the defaults on Linux/macOS

  "/usr/bin",
  "/usr/local/bin"
]
```


Enjoy.
