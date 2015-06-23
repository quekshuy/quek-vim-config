
colorscheme torte 
set guifont=Monaco:h11

"PLUGINS via vim plug https://github.com/junegunn/vim-plug

call plug#begin()
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'fatih/vim-go'
Plug 'tpope/vim-rails'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'elixir-lang/vim-elixir'
call plug#end()

set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
"set smartindent
set expandtab
set showmatch
set number
set encoding=utf-8
set tags=./tags,tags
set laststatus=2
set statusline=%{fugitive#statusline()}
set statusline+=%f


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

map <leader>n :NERDTreeToggle
nnoremap <leader>a :Ag!

nnoremap <leader>c :!ctags -R .

"CtrlP search mixed (files, buffers and MRU)
let g:ctrlp_cmd='CtrlPMixed'
"CtrlP jump to open files in other tabs
let g:ctrlp_switch_buffer='Et'

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

au FileType python set omnifunc=pythoncomplete#Complete

if has("gui_macvim")

autocmd FileType python set omnifunc=pythoncomplete#Complete
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

