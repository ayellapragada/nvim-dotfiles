" Plugins
call plug#begin()
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'kana/vim-textobj-user'
Plug 'markonm/traces.vim'
Plug 'mhinz/vim-signify'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier'
Plug 'rhysd/git-messenger.vim'
Plug 'rlue/vim-fold-rspec'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'troydm/zoomwintab.vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'

" Experimental Plugins
Plug 'jreybert/vimagit'
Plug 'liuchengxu/vista.vim'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-projectionist'
call plug#end()

set background=dark
colorscheme gruvbox

set updatetime=300

let g:clever_f_across_no_line    = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms        = 3000

" Better display for messages
set cmdheight=2

" ESCAPE BETTER WOO.
inoremap jk <esc>
tnoremap jk <C-\><C-n>

" Quicker split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Fix j and k for visual lines
nmap j gj
nmap k gk

" Have relative line numbers, with actual line number of current line.
set number
set relativenumber

" Leader and easier command
let mapleader = " "
nnoremap , :

nnoremap <silent> <leader>ff :Rg<CR>
nnoremap <silent> <Leader>fg :Rg <C-R><C-W><CR>

nnoremap <leader>n :nohl<CR>
nnoremap <C-p> :GFiles<cr>


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
