set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor=
set hidden
set nohlsearch
set noerrorbells
set nowrap
set noswapfile
set nobackup
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set number
set foldmethod=indent


call plug#begin()
Plug 'sindrets/diffview.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'akinsho/flutter-tools.nvim'
Plug 'thosakwe/vim-flutter'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

lua << EOF
local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup()
vim.cmd[[colorscheme catppuccin]]
EOF
highlight Normal guibg=none

let mapleader=" "
" Telescope command
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" end Telescope command

" NERDCommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" End NERDComment

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

augroup THE_PAIKIUS
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" vimrc
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
let g:dart_style_guide = 4


lua require('paikius')
