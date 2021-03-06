let g:ale_disable_lsp = 1

call plug#begin()
Plug 'AaronLasseigne/yank-code'
Plug 'airblade/vim-localorie'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'arzg/vim-colors-xcode'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'brooth/far.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm'
Plug 'kshenoy/vim-signature'
Plug 'lambdalisue/fern.vim'
Plug 'liuchengxu/vista.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-swap'
Plug 'markonm/traces.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-signify'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'rhysd/conflict-marker.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vimwiki/vimwiki'
Plug 'wellle/targets.vim'

" Experimental
Plug 'ChartaDev/charta.vim'
Plug 'aonemd/kuroi.vim'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/goyo.vim'
call plug#end()

" " something is bugged in CoC these are yolos
" autocmd VimEnter * let b:coc_suggest_disable = 1
" set completeopt-=preview

" General Settings

" Theme and Lightline
if has('termguicolors')
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark   "or use the light theme: set background=light
" colorscheme kuroi
colorscheme xcodedarkhc

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'cocstatus', 'filetype' ] ]
      \ },
      \ 'tabline': { 'left': [['tabs']], 'right': [] },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ }
      \ }
function! LightlineModified()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
endfunction
function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

set updatetime=300
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
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <Backspace> <C-^>

" Correctly locate new splits
set splitright
set splitbelow

" Make macros easier to use.
nnoremap Q @q
vnoremap Q :norm @q<cr>

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

"Leader Mappings
nnoremap <leader>ff :Rg<CR>
nnoremap <leader>fa :ALEFix<CR>
nnoremap <leader>fp :Prettier<CR>
nnoremap <Leader>fg :Rg <C-R><C-W><CR>
nnoremap <Leader>fg :Rg <C-R><C-W><CR>
nnoremap <leader>n :nohl<CR>
nmap <Leader>vr :tabnew $MYVIMRC<cr>
nmap <Leader>so :source $MYVIMRC<cr>
nnoremap <Leader>vv :Vista!!<cr>
nnoremap <Leader>tt :Ttoggle<cr>
vnoremap <Leader>ts :TREPLSendSelection<cr>
nnoremap <Leader>ts :TREPLSendLine<cr>
nnoremap <Leader>tn :TestNearest<cr>
nnoremap <Leader>tf :TestFile<cr>
nnoremap <Leader>tl :TestLast<cr>
nnoremap <leader>lt :call localorie#translate()<CR>
map <Leader>yc :YankCode<cr>

nnoremap <silent><leader>1 :source $MYVIMRC \| :PlugInstall<CR>

" Plugin Settings

" fzf
nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif
let g:fzf_preview_window = 'right:60%'
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

" ale
let g:ale_linters = {
\   'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\}

" HighlightYank
let g:highlightedyank_highlight_duration = 250

" vim wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" neoterm
command! -nargs=+ TT Topen | T <args>
let g:neoterm_autoscroll = '1'
let g:neoterm_size = 16
let g:neoterm_repl_ruby = 'pry'
let g:neoterm_default_mod = 'botright'
let g:neoterm_automap_keys = 'ztt'
tnoremap <C-q> <C-\><C-n>:q<CR>

" vim-test
let test#strategy = "neovim"
" let test#javascript#jest#options = '--watchAll=false'

" fern.vim
nmap - :Fern . -reveal=%<cr>
nmap <C-n> :Fern . -drawer -width=50 -toggle<CR>
function! s:init_fern() abort
  " REALLY DO NOT WANT TO ADD MUCH INTO HERE BEYOND WHAT IS _NEEDED_
  " Unmap Ctrl-h for tmux split navigation, except a new bug is here?
  " unmap <buffer> <C-h>
  nmap <buffer> <C-l> <C-w>l

  " Recenter page, same as in normie mode
  nmap <buffer> zz zz

  " Define NERDTree like mappings
  nmap <buffer> o <Plug>(fern-action-open:edit)
  nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> T <Plug>(fern-action-open:tabedit)gT
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p

  nmap <buffer> u <Plug>(fern-action-leave)
  nmap <buffer> r <Plug>(fern-action-reload)

  " Toggle expand or close of current folder
  nmap <buffer><expr>
        \ <Plug>(fern-my-expand-or-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-collapse)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer><nowait> l <Plug>(fern-my-expand-or-collapse)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

" CoC.nvim
" Remap keys for gotos
nmap <silent> ga <Plug>(coc-codeaction-selected)w
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gh <Plug>(coc-fix-current)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gn <Plug>(coc-rename)
set shortmess+=c

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_global_extensions = [
      \ 'coc-actions',
      \ 'coc-eslint',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-markdownlint',
      \ 'coc-prettier',
      \ 'coc-solargraph',
      \ 'coc-sql',
      \ 'coc-tailwindcss',
      \ 'coc-tsserver'
      \ ]

" Splitjoin
let g:splitjoin_ruby_hanging_args = 0

" Closetag
let g:closetag_filetypes = 'html,xhtml,jsx,tsx'
let g:closetag_filenames = "*.html,*.xhtml,*.jsx,*.tsx"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

" Vista
let g:vista_default_executive = 'coc'
let g:vista_executive_for = {
      \ 'vimwiki': 'markdown',
      \ 'markdown': 'toc',
      \ }
let g:vista_sidebar_width = 40
let g:vista#renderer#enable_icon = 0

" VimWiki remap
nmap [][] <Plug>VimwikiRemoveHeaderLevel

" Charta
let g:charta_api_token="SFMyNTY.g2gDdAAAAAFkAAd1c2VyX2lkYQxuBgCy1xo-dgFiAAFRgA.0x5qm5OoauYwK_irkGylvfwioQqvVtrHpIRM-pCO7nI"

" Handle using en.yml files better
autocmd CursorMoved *.yml echo localorie#expand_key()
let g:localorie = {
      \ 'quickfix':  1,
      \ 'switch':    1
      \ }
