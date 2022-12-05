call plug#begin()
Plug 'AaronLasseigne/yank-code'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-signify'
Plug 'nathom/filetype.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
" Neovim Updates / Replacements
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'folke/trouble.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hashivim/vim-terraform'
call plug#end()

" General Settings

" Theme
if has('termguicolors')
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark

set updatetime=250
set re=0

" Better display for messages
set cmdheight=2
set signcolumn=yes

" Have relative line numbers, with actual line number of current line.
set number
set relativenumber

" Better Search
set ignorecase
set smartcase

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Better Escape
inoremap jk <esc>
tnoremap jk <C-\><C-n>

" Fix j and k for visual lines
nmap j gj
nmap k gk

" Quicker split navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nnoremap <Backspace> <C-^>

" Correctly locate new splits
set splitright
set splitbelow

" Make macros easier to use.
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Enable mouse mode
set mouse=a

" Remap Esc for terminal mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Tmux stuff
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Leader and easier command
let mapleader = " "
nnoremap , :

" Folding
set foldmethod=indent
set foldcolumn=0
set nofoldenable

" Better substitute and replace
set inccommand=split

"Leader Mappings
nnoremap <leader>ff <cmd>Telescope live_grep<cr>
nnoremap <leader>n :nohl<CR>
nnoremap <Leader>tn :TestNearest<cr>
nnoremap <Leader>tf :TestFile<cr>
nnoremap <Leader>tl :TestLast<cr>
map <Leader>yc :YankCode<cr>

nnoremap <silent><leader>1 :source $MYVIMRC \| :PlugInstall<CR>

" Plugin Settings

if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif
nmap <C-p> <cmd>Telescope find_files<cr>

let g:highlightedyank_highlight_duration = 250

let test#strategy = "neovim"

let g:terraform_fmt_on_save=1
let g:terraform_align=1

lua <<EOF
require("filetype").setup({
  overrides = {
    extensions = {
      tf = "terraform",
      tfvars = "terraform",
      tfstate = "json",
    },
  }
})

require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
  rainbow = { enable = true, extended_mode = true },
})

require("Comment").setup()

require("nvim-ts-autotag").setup()

require("trouble").setup()

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "solargraph", "terraformls", "tflint" }
})
require("mason-lspconfig").setup_handlers {
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
    end
}
EOF
