
colorscheme torte 
set guifont=Monaco:h12

filetype on
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on 

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set expandtab
syntax on
set showmatch
set number
set encoding=utf-8
set tags=./tags,tags


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

map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>
map <leader>td <Plug>TaskList
nnoremap <leader>a :Ack!
nnoremap <leader>n :NERDTreeToggle
"nnoremap <leader>t :TlistToggle
nnoremap <leader>c :!ctags -R .

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

if has("gui_macvim")

autocmd FileType python set omnifunc=pythoncomplete#Complete

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

