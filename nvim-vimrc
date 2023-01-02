
" Vim plug plugins
call plug#begin()
  " Comment out if favoring nvim telescope for file search
  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
  " Plug 'junegunn/fzf.vim'

  " Provide interface for interacting with git branches
  Plug 'idanarye/vim-merginal'
  Plug 'scrooloose/nerdcommenter'
  " GIT
  Plug 'tpope/vim-fugitive'
  ":Gbrowse to open current file on github
  Plug 'tpope/vim-rhubarb'

  " Dockerfiles
  Plug 'ekalinin/Dockerfile.vim'

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
  Plug 'machakann/vim-highlightedyank'

  " Other languages
  Plug 'avdgaag/vim-phoenix'
  Plug 'kchmck/vim-coffee-script'
  Plug 'elixir-lang/vim-elixir'
  Plug 'delphinus/vim-firestore'

  ":BD to close a buffer without closing the pane
  Plug 'qpkorr/vim-bufkill'

  " Alter commands in vimscript/.vimrc file
  " Allow us to rewrite some predefined commands.
  Plug 'kana/vim-altercmd'

  ":Delete, :Rename
  Plug 'tpope/vim-eunuch'

  "Pretty
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'

  " language server quick start
  Plug 'neovim/nvim-lspconfig'

  " autopairs
  Plug 'windwp/nvim-autopairs'
  Plug 'RRethy/nvim-treesitter-endwise'

  " nvim-telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  " nvim-treesitter: syntax highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Autocomplete
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " Snippet plugin, required for nvim/cmp completion
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'

  " Snippets
  Plug 'rafamadriz/friendly-snippets'

  " added for Typescript work
  " as documented in 
  " https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
  " Plug 'jose-elias-alvarez/null-ls.nvim'
  " Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

  " Theme with treesitter support
  Plug 'navarasu/onedark.nvim'
call plug#end()

" UI
" For use with onehalf
" colorscheme onehalfdark
set guifont=Hack:h16
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Make vim limelight work
set termguicolors

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

" new tab
nnoremap <C-t> :tabnew<CR>
"Getting around tabs in neovim
nnoremap <S-h> :tabprev<cr>
nnoremap <S-l> :tabnext<cr>


" deprecate in lieu of nvim-telescope
nnoremap <leader>w :Windows<cr>
nnoremap <leader>g :Goyo<cr>
nnoremap <leader>s :Gstatus<cr>

"=================================================================
" NEOVIM BUILT-IN LANGUAGE SERVER CLIENT
"=================================================================
" CONFIGURATION IS IN LUA
lua << EOF

-- neovim Theme
-- neovim Theme
require('onedark').setup {
  style = 'warmer'
}
require('onedark').load()

-- nvim-treesitter syntax highlighting
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'lua', 'python', 'typescript', 'javascript', 'ruby', 'elixir'  },
  endwise = {
    enable = true
  },
}

local npairs = require('nvim-autopairs')
npairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

require"telescope".setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

EOF

" Import Lua based configs
" custom-nvim-cmp must come first because custom-lsp-config relies on it.
lua require('custom-nvim-cmp')
lua require("custom-lsp-config")

"=================================================================
" NVIM-TELESCOPE
"=================================================================
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>a <cmd>lua require('telescope.builtin').live_grep()<cr>

" Puts a column to the left of line numbers
set signcolumn=yes

"=================================================================
" BUFFER MANAGEMENT
"=================================================================
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

" Alt-h (on Mac)
nnoremap ˙ <C-w>h
" Alt-j (on Mac)
nnoremap ∆ <C-w>j
" Alt-k (on Mac)
nnoremap ˚ <C-w>k
" Alt-l (on Mac)
nnoremap ¬ <C-w>l

"=================================================================
" FILE TYPE SPECIFICS
"=================================================================
au FileType python setlocal sw=4 sts=4 ts=4 et
au FileType ruby setlocal nowrap sw=2 sts=2 ts=2 et
" From posva/vim-vue
autocmd FileType vue syntax sync fromstart
" Dockerfile
au BufRead,BufNewFile *.docker setfiletype Dockerfile

"=================================================================
" ONI VIM VS NORMAL NEOVIM
"=================================================================
" Experimenting with Oni (https://github.com/onivim/oni/wiki/Configuration),
" which provides some IDE like features. We turn off these same IDE features
" that exist in vim/neovim when Oni uses this config file.
"
" 1. Use Oni's file search instead of fzf for opening files.
if exists("g:gui_oni")
  "Getting around tabs in buffer mode in Onivim
  nnoremap <S-h> :bprev<cr>
  nnoremap <S-l> :bnext<cr>

  " Totally hide the status bar
  set laststatus=0
  set noshowmode
  set noruler
  set noshowcmd
else
  " Search for file using fzf
  " Comment out if in favor of nvim-telescope
  " nnoremap <C-p> :FZF<cr>

  " Always displays the status line
  set laststatus=2
  " Show git status in status line
  set statusline=%{fugitive#statusline()}
  set statusline+=%f

  "Set status line so current window is more visible
  hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
  hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none

endif
