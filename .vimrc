" UI
colorscheme onedark
set guifont=Hack:h16
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


"PLUGINS via vim plug https://github.com/junegunn/vim-plug

call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake'
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-vinegar'
" for automatically providing end-parentheses, etc
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'avdgaag/vim-phoenix'
"NEOVIM specific plugins
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
call plug#end()


set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
"set smartindent
set expandtab
set showmatch
set number
"set encoding=utf-8
set tags=./tags,tags
set laststatus=2
set statusline=%{fugitive#statusline()}
set statusline+=%f
"no end of file at the end of files
set noeol

"Allow yank to macOS clipboard as well
set clipboard=unnamed

"Set status line so current window is more visible
hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none

nnoremap / /\v
vnoremap / /\v
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


"NERDTree replacement, netrw
let g:netrw_liststyle=3
let g:netrw_winsize=25
map <leader>n :Lexplore<cr>

"Vim Closetag
let g:closetag_filenames = "*.html,*.html.erb"

"Deoplete use tab for running through autocomplete options
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"Getting around tabs in neovim
nnoremap <C-t> :tabnew<CR>
nnoremap <S-h> :tabprev<cr>
nnoremap <S-l> :tabnext<cr>

nnoremap <leader>a :Ag<cr>
nnoremap <C-p> :FZF<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>w :Windows<cr>
nnoremap <leader>g :Gstatus<cr>

if has('nvim')
"=================================================================
" CHANGES FOR NVIM TERM EMULATOR
"=================================================================
" Easy entrance into terminal mode
nnoremap <leader>t :vsp \| :term<cr>

" Map Alt-{h,j,k,l} in all modes to easily move between panes
" read this for how to map Alt-keys on a Mac
" http://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
" Alt-h (on Mac)
tnoremap ˙ <C-\><C-n><C-w>h
" Alt-j (on Mac)
tnoremap ∆ <C-\><C-n><C-w>j
" Alt-k (on Mac)
tnoremap ˚ <C-\><C-n><C-w>k
" Alt-l (on Mac)
tnoremap ¬ <C-\><C-n><C-w>l
endif

" Alt-h (on Mac)
nnoremap ˙ <C-w>h
" Alt-j (on Mac)
nnoremap ∆ <C-w>j
" Alt-k (on Mac)
nnoremap ˚ <C-w>k
" Alt-l (on Mac)
nnoremap ¬ <C-w>l

"=================================================================
" NEOMAKE
"=================================================================
let g:neomake_coffeescript_enabled_makers=['coffeelint']
autocmd! BufWritePost * Neomake

" Neomake breaks live code reloading in Phoenix, so this is a
" workaround found at https://github.com/phoenixframework/phoenix/issues/1165
let g:neomake_elixir_enabled_makers = ['elixir']
let g:neomake_elixir_elixir_maker = {
      \ 'exe': 'elixirc',
      \ 'args': [
        \ '--ignore-module-conflict', '--warnings-as-errors',
        \ '--app', 'mix', '--app', 'ex_unit',
        \ '-o', '$TMPDIR', '%:p'
      \ ],
      \ 'errorformat':
          \ '%E** %s %f:%l: %m,' .
          \ '%W%f:%l'
      \ }

"Deoplete
let g:deoplete#enable_at_startup=1

au FileType python set omnifunc=pythoncomplete#Complete
au FileType ruby setlocal nowrap

if has("gui_macvim")

"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab tabstop=2 softtabstop=2
inoremap <Nul> <C-x><C-o>


python << EOF
import os
import sys
import vim
#allows you to go to the file of a particular import stmt
for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))

# Allows you to source libraries in the virtualenv
if 'VIRTUAL_ENV' in os.environ:
        project_base_dir = os.environ['VIRTUAL_ENV']
        sys.path.insert(0, project_base_dir)
        activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
        execfile(activate_this, dict(__file__=activate_this))
EOF

endif

