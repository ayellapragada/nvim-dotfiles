" Plugins
call plug#begin()
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-sandwich'
Plug 'markonm/traces.vim'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-signify'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier'
Plug 'rhysd/clever-f.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'rlue/vim-fold-rspec'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'troydm/zoomwintab.vim'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Experimental Plugins
Plug 'junegunn/gv.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-projectionist'
call plug#end()

" General Settings

" Theme 
set background=dark
colorscheme gruvbox

set updatetime=300

" Better display for messages
set cmdheight=2
set signcolumn=yes

" Have relative line numbers, with actual line number of current line.
set number
set relativenumber

" Better Search
set ignorecase
set smartcase
set incsearch

" Better Escape
inoremap jk <esc>
tnoremap jk <C-\><C-n>

" Fix j and k for visual lines
nmap j gj
nmap k gk

" Quicker split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Correctly locate new splits
set splitright
set splitbelow

" Remap Esc for terminal mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" Leader and easier command
let mapleader = " "
nnoremap , :

"Leader Mappings
nnoremap <leader>ff :Rg<CR>
nnoremap <Leader>fg :Rg <C-R><C-W><CR>
nnoremap <leader>n :nohl<CR>
nnoremap <leader>co :Codi!!<CR>
nnoremap <leader>m :Magit<CR>
nmap <leader>vr :vs $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
vnoremap <Leader>st :TREPLSendSelection<cr>
nnoremap <Leader>st :TREPLSendLine<cr>

" Plugin Settings

" clever-f
let g:clever_f_across_no_line    = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms        = 3000

" vim-sandwich
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
" add spaces inside bracket
let g:sandwich#recipes += [
      \   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
      \   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
      \   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
      \   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
      \   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
      \   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
      \ ]

" fzf
nnoremap <C-p> :Files<cr>

" HighlightYank
let g:highlightedyank_highlight_duration = 250

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
map - :NERDTreeFind<cr>
" Close nerdtree if last open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" enable line numbers
let NERDTreeShowLineNumbers=1 
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
"show hidden files
let NERDTreeShowHidden=1

" vim wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" neoterm
command! -nargs=+ TT Topen | T <args>
let g:neoterm_autoscroll = '1'
let g:neoterm_size = 16
let g:neoterm_repl_ruby = 'pry'
tnoremap <C-q> <C-\><C-n>:q<CR>

" CoC.nvim
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" True Colors
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
