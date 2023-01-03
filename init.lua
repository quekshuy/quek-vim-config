-- --------------------------------------------
-- PACKAGE MANAGER
-- Lazy.nvim
-- https://github.com/folke/lazy.nvim
-- --------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  -- --  Provide interface for interacting with git branches
  'idanarye/vim-merginal',
  'scrooloose/nerdcommenter',
  --  GIT
  'tpope/vim-fugitive',
  -- :Gbrowse to open current file on github
  'tpope/vim-rhubarb',
 
  --  Dockerfiles
  -- 'ekalinin/Dockerfile.vim'

  --  Ruby
  -- 'tpope/vim-rails'
  -- 'vim-ruby/vim-ruby'
  -- 'noprompt/vim-yardoc'

  --  Javascript
  -- 'pangloss/vim-javascript'
  -- 'posva/vim-vue'

  --  Generic coding
  'tpope/vim-surround',
  'alvan/vim-closetag',
  'tpope/vim-vinegar',
  'machakann/vim-highlightedyank',

  --  Other languages
  -- 'avdgaag/vim-phoenix'
  -- 'kchmck/vim-coffee-script'
  -- 'elixir-lang/vim-elixir'
  -- 'delphinus/vim-firestore'

  -- :BD to close a buffer without closing the pane
  'qpkorr/vim-bufkill',

  -- :Delete, :Rename
  'tpope/vim-eunuch',

  -- Pretty
  {
    'junegunn/goyo.vim',
    dependencies = {
      'junegunn/limelight.vim',
    },
    cmd = "Goyo"
  },

  --  language server quick start
  'neovim/nvim-lspconfig',

  --  autopairs
  'windwp/nvim-autopairs',
  'RRethy/nvim-treesitter-endwise',

  --  nvim-telescope
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  --  nvim-treesitter: syntax highlighting
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  --  Autocomplete
  { 
    'hrsh7th/nvim-cmp',
    -- load cmp on InsertEnter
    -- :help InsertEnter
    events = 'InsertEnter',
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    }
  },

  --  Snippet plugin, required for nvim/cmp completion
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',

  --  Snippets
  'rafamadriz/friendly-snippets',

  --  added for Typescript work
  --  as documented in 
  --  https://jose-elias-alvarez.medium.com/configuring-neovims-lsp-client-for-typescript-development-5789d58ea9c
  --  'jose-elias-alvarez/null-ls.nvim'
  --  'jose-elias-alvarez/nvim-lsp-ts-utils'

  --  Theme with treesitter support
  'navarasu/onedark.nvim',

  -- Status line
  { 
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons'
    }
  },
})

-- " UI
-- " For use with onehalf
-- " colorscheme onehalfdark
-- set guifont=Hack:h16
vim.opt.guifont = 'Hack:h16'

-- let $NVIM_TUI_ENABLE_TRUE_COLOR=1
--
vim.g.NVIM_TUI_ENABLE_TRUE_COLOR = 1
-- " Make vim limelight work
-- set termguicolors
vim.opt.termguicolors = true

-- set tabstop=2
vim.opt.tabstop = 2
-- set shiftwidth=2
vim.opt.shiftwidth = 2
-- set softtabstop=2
vim.opt.softtabstop = 2
-- set autoindent
vim.opt.autoindent = true
-- "set smartindent
-- set expandtab
vim.opt.expandtab = true
-- set showmatch
vim.opt.showmatch = true
-- set number
vim.opt.number = true
-- "set encoding=utf-8
-- set tags=./tags,tags
vim.opt.tags = './tags,tags'
-- "no end of file at the end of files
-- set noeol
-- this is the only way to do it in Lua
-- vim.opt.noeol = true doesn't work
vim.api.nvim_command("set noeol")

-- "Allow yank to macOS clipboard as well
-- set clipboard=unnamed
vim.opt.clipboard = 'unnamed'
-- "Allows using mouse to set cursor when in Iterm
-- set mouse=a
vim.opt.mouse = 'a'

-- nnoremap / /\v
--             <mode>  <keys>  <actions>   <options>
vim.keymap.set('n',    '/',    '/\v',      { noremap = true })
-- vnoremap / /\v
vim.keymap.set('v',    '/',    '/\v',      { noremap = true })
-- nnoremap <up> <nop>
-- nnoremap <down> <nop>
-- nnoremap <left> <nop>
-- nnoremap <right> <nop>
vim.keymap.set('n',    '<up>',    '<nop>',      { noremap = true })
vim.keymap.set('n',    '<down>',    '<nop>',      { noremap = true })
vim.keymap.set('n',    '<left>',    '<nop>',      { noremap = true })
vim.keymap.set('n',    '<right>',    '<nop>',      { noremap = true })
-- inoremap <up> <nop>
-- inoremap <down> <nop>
-- inoremap <left> <nop>
-- inoremap <right> <nop>
vim.keymap.set('i',    '<up>',    '<nop>',      { noremap = true })
vim.keymap.set('i',    '<down>',    '<nop>',      { noremap = true })
vim.keymap.set('i',    '<left>',    '<nop>',      { noremap = true })
vim.keymap.set('i',    '<right>',    '<nop>',      { noremap = true })

-- "NERDTree replacement, netrw
-- let g:netrw_liststyle=3
-- let g:netrw_winsize=25
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25 
-- map <leader>n :Lexplore<cr>
vim.keymap.set('',    '<Leader>n',    ':Lexplore<cr>')

-- "Vim Closetag
-- let g:closetag_filenames = "*.html,*.html.erb,*.vue"
vim.g.closetag_filenames = '*.html,*.html.erb,*.vue'

-- " new tab
-- nnoremap <C-t> :tabnew<CR>
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', { noremap = true })
-- "Getting around tabs in neovim
-- nnoremap <S-h> :tabprev<cr>
-- nnoremap <S-l> :tabnext<cr>
vim.keymap.set('n', '<S-h>', ':tabprev<CR>', { noremap = true })
vim.keymap.set('n', '<S-l>', ':tabnext<CR>', { noremap = true })


-- nnoremap <leader>g :Goyo<cr>
vim.keymap.set('n', '<Leader>g', ':Goyo<CR>', { noremap = true })


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

-- " Import Lua based configs
-- " custom-nvim-cmp must come first because custom-lsp-config relies on it.
require('custom-nvim-cmp')
require("custom-lsp-config")

-- "=================================================================
-- " NVIM-TELESCOPE
-- "=================================================================
-- nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>a <cmd>lua require('telescope.builtin').live_grep()<cr>
vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').find_files() end, { noremap = true })
vim.keymap.set('n', '<Leader>b', function() require('telescope.builtin').buffers() end, { noremap = true })
vim.keymap.set('n', '<Leader>a', function() require('telescope.builtin').live_grep() end, { noremap = true })

-- " Puts a column to the left of line numbers
-- set signcolumn=yes
vim.opt.signcolumn = 'yes'

-- "=================================================================
-- " BUFFER MANAGEMENT
-- "=================================================================
-- "Don't use vbufkill's keyboard mapping because
-- "they slow down responsiveness of :Buffers
-- let g:BufKillCreateMappings=0
vim.g.BufKillCreateMappings = 0


-- "=================================================================
-- " VIM POLYGLOT SYNTAX HIGHLIGHTING
-- "=================================================================
-- syntax on enabled by default
-- syntax on
-- " To disable polyglot highlighting
-- "let g:polyglot_disabled = ['css']
vim.g.polyglot_disabled = { 'css' }

-- ----------------------------------------
-- NERD COMMENTER
-- ----------------------------------------
-- filetype plugin on -- Default on
-- " Adds a space after comment symbols
vim.g.NERDSpaceDelims = 1


-- DEPRECATE IN NEOVIM

-- "=================================================================
-- " CHANGES FOR NVIM TERM EMULATOR
-- "=================================================================
-- " Easy entrance into terminal mode
-- nnoremap <leader>t :vsp \| :term<cr>
vim.keymap.set('n', '<Leader>t', ':vsp | :term<CR>', { noremap = true })

-- " Map Alt-{h,j,k,l} in all modes to easily move between panes
-- " read this for how to map Alt-keys on a Mac
-- " http://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
-- " Alt-h (on Mac)
-- tnoremap ˙ <C-\><C-n><C-w>h
-- " Alt-j (on Mac)
-- tnoremap ∆ <C-\><C-n><C-w>j
-- " Alt-k (on Mac)
-- tnoremap ˚ <C-\><C-n><C-w>k
-- " Alt-l (on Mac)
-- tnoremap ¬ <C-\><C-n><C-w>l
vim.keymap.set('t', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true })
vim.keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true })
vim.keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true })
vim.keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true })

-- " Alt-h (on Mac)
-- nnoremap ˙ <C-w>h
vim.keymap.set('n', '<A-h>', '<C-w>h', { noremap = true })
-- " Alt-j (on Mac)
-- nnoremap ∆ <C-w>j
vim.keymap.set('n', '<A-j>', '<C-w>j', { noremap = true })
-- " Alt-k (on Mac)
-- nnoremap ˚ <C-w>k
vim.keymap.set('n', '<A-k>', '<C-w>k', { noremap = true })
-- " Alt-l (on Mac)
-- nnoremap ¬ <C-w>l
vim.keymap.set('n', '<A-l>', '<C-w>l', { noremap = true })

-- "=================================================================
-- " FILE TYPE SPECIFICS
-- "=================================================================
-- au FileType python setlocal sw=4 sts=4 ts=4 et
vim.api.nvim_create_autocmd('FileType', { pattern = 'python', callback = function() 
  vim.opt_local.sw = 4 
  vim.opt_local.sts = 4
  vim.opt_local.ts = 4
  vim.opt_local.et = true
end
})

-- au FileType ruby setlocal nowrap sw=2 sts=2 ts=2 et
vim.api.nvim_create_autocmd('FileType', { pattern = 'ruby', callback = function() 
  vim.opt_local.nowrap = true
  vim.opt_local.sw = 2 
  vim.opt_local.sts = 2
  vim.opt_local.ts = 2
  vim.opt_local.et = true
end
})
-- " From posva/vim-vue
-- autocmd FileType vue syntax sync fromstart
vim.api.nvim_create_autocmd('FileType', { pattern = 'vue', command = 'syntax sync fromstart' })
-- " Dockerfile
-- au BufRead,BufNewFile *.docker setfiletype Dockerfile
vim.api.nvim_create_autocmd('BufRead,BufNewFile', { pattern = '*.docker', command = 'setfiletype Dockerfile' })

-- " Always displays the status line
-- set laststatus=2
vim.opt.laststatus = 2

-- STATUS LINE
require('lualine').setup()
