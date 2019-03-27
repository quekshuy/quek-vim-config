" UI
colorscheme onedark
set guifont=Hack:h16
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


"PLUGINS via vim plug https://github.com/junegunn/vim-plug

call plug#begin()

" File search (Ctrl-P)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

" GIT
Plug 'tpope/vim-fugitive'
":Gbrowse to open current file on github
Plug 'tpope/vim-rhubarb'

" Provide interface for interacting with git branches
Plug 'idanarye/vim-merginal'
Plug 'scrooloose/nerdcommenter'

" All the syntax highlighting
Plug 'sheerun/vim-polyglot'

" Ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'noprompt/vim-yardoc'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'

" Generic coding
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-vinegar'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'

" Other languages
Plug 'avdgaag/vim-phoenix'
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-lang/vim-elixir'

":BD to close a buffer without closing the pane
Plug 'qpkorr/vim-bufkill'

":Delete, :Rename
Plug 'tpope/vim-eunuch'

":Linting
Plug 'w0rp/ale'

"Pretty
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"NEOVIM specific plugins
if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Autocompletion manager
  Plug 'ncm2/ncm2'
  " ncm2 dependency
  Plug 'roxma/nvim-yarp' 
  " ncm2 autocomplete sources
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  " LanguageServer client for NeoVim.
  " For use with ncm2
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
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
"no end of file at the end of files
set noeol

"Allow yank to macOS clipboard as well
set clipboard=unnamed
"Allows using mouse to set cursor when in Iterm
set mouse=a


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
let g:closetag_filenames = "*.html,*.html.erb,*.vue"

"Deoplete use tab for running through autocomplete options
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" new tab
nnoremap <C-t> :tabnew<CR>
"Getting around tabs in neovim
nnoremap <S-h> :tabprev<cr>
nnoremap <S-l> :tabnext<cr>


nnoremap <leader>b :Buffers<cr>
nnoremap <leader>w :Windows<cr>
nnoremap <leader>g :Gstatus<cr>

"=================================================================
" NCM2 AUTOCOMPLETION
"=================================================================
if has('nvim')
"ncm2 (autocomplete)
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
let g:LanguageClient_serverCommands = {
  \ 'typescript': ['javascript-typescript-stdio']
  \ }
endif

"=================================================================
" DEOPLETE OLD AUTOCOMPLETION
"=================================================================
"Deoplete (autocomplete)
" let g:deoplete#enable_at_startup=1

" Search all files using fzf + Ag
nnoremap <leader>a :Ag<cr>
" When using Ag to search, does not match file names, just file contents
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

"Experimenting with Oni (https://github.com/onivim/oni/wiki/Configuration),
"which provides some IDE like features. We turn off these same IDE features
"that exist in vim/neovim when Oni uses this config file.
if exists("g:gui_oni")
  "Getting around tabs in buffer mode in Onivim
  nnoremap <S-h> :bprev<cr>
  nnoremap <S-l> :bnext<cr>

  " Totally hide the status bar
  set laststatus=0
  set noshowmode
  set noruler
  set noshowcmd

  " Use Onivim's file search
  " nnoremap <leader>a :call OniCommand('search.searchAllFiles')<cr>
else

  " Search for file using fzf
  nnoremap <C-p> :FZF<cr>

  " Always displays the status line
  set laststatus=2
  " Show git status in status line
  set statusline=%{fugitive#statusline()}
  set statusline+=%f

  "Set status line so current window is more visible
  hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
  hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none

endif

"Don't use vbufkill's keyboard mapping because
"they slow down responsiveness of :Buffers
let g:BufKillCreateMappings=0

"=================================================================
" VIM POLYGLOT SYNTAX HIGHLIGHTING
"=================================================================
syntax on
" To disable polyglot highlighting
"let g:polyglot_disabled = ['css']

"=================================================================
" NERD COMMENTER
"=================================================================
filetype plugin on
" Adds a space after comment symbols
let NERDSpaceDelims=1

"=================================================================
" ALE (LINTING)
"=================================================================
" Vuejs
let g:ale_linter_aliases = { 'vue': ['vue', 'javascript']}
let g:ale_fixers = { 'typescript': ['prettier'], 'javascript': ['prettier_standard'], 'python': ['autopep8'], 'ruby': ['standardrb'], '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_linters = {  'typescript': ['tslint'], 'javascript': ['standard'], 'ruby': ['standardrb'], 'python': ['pycodestyle'], 'vue': ['prettier_eslint', 'vls'] }
let g:ale_javascript_prettier_eslint_options = '--semi false'
" Automatic fixing on save
" let g:ale_fix_on_save = 1


if has('nvim')

" Make vim limelight work
set termguicolors

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
" NEOMAKE (uncomment if using neomake)
"=================================================================
"let g:neomake_coffeescript_enabled_makers=['coffeelint']
"autocmd! BufWritePost * Neomake

"" Neomake breaks live code reloading in Phoenix, so this is a
"" workaround found at https://github.com/phoenixframework/phoenix/issues/1165
"let g:neomake_elixir_enabled_makers = ['elixir']
"let g:neomake_elixir_elixir_maker = {
      "\ 'exe': 'elixirc',
      "\ 'args': [
        "\ '--ignore-module-conflict', '--warnings-as-errors',
        "\ '--app', 'mix', '--app', 'ex_unit',
        "\ '-o', '$TMPDIR', '%:p'
      "\ ],
      "\ 'errorformat':
          "\ '%E** %s %f:%l: %m,' .
          "\ '%W%f:%l'
      "\ }



"=================================================================
" FILE TYPE SPECIFICS
"=================================================================
au FileType python setlocal sw=4 sts=4 ts=4 et
au FileType ruby setlocal nowrap sw=2 sts=2 ts=2 et
" From posva/vim-vue
autocmd FileType vue syntax sync fromstart

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
