" UI
let path = expand('~') . '/.vim'
if exists('g:vscode')
  exec 'source' path . '/nvim-vscode-vimrc'
elseif has('nvim')
  " Normal Neovim
  exec 'source' path . '/nvim-vimrc'
else
  " Just Vim
  exec 'source' path . '/standard-vimrc'
endif
