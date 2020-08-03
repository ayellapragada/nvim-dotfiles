call plug#begin()
Plug 'AaronLasseigne/yank-code'
Plug 'alok/notational-fzf-vim'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'DanilaMihailov/beacon.nvim'
Plug 'dense-analysis/ale'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-textobj-user'
Plug 'kassio/neoterm'
Plug 'kkoomen/vim-doge'
Plug 'kshenoy/vim-signature'
Plug 'lambdalisue/fern.vim'
Plug 'leafgarland/typescript-vim'
Plug 'liuchengxu/vista.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-swap'
Plug 'markonm/traces.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mhinz/vim-signify'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/jsonc.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'psliwka/vim-smoothie'
Plug 'rhysd/git-messenger.vim'
Plug 'RobertAudi/GoldenView.vim'
Plug 'sbdchd/neoformat' " SPEND SOME TIME GETTING THIS SET UP
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

" Experimental Plugins
" Plug 'mattn/emmet-vim' " Honestly I just don't know how to use this
" Plug 'ms-jpq/chadtree' " A possible alternative for fern.vim
call plug#end()

" General Settings

" Theme and Lightline
if has('termguicolors')
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set background=dark
colorscheme palenight

let g:lightline = {
      \ 'colorscheme' : 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'cocstatus', 'filetype' ] ]
      \ },
      \ 'tabline': { 'left': [['tabs']], 'right': [] },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
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
function! LightlineFugitive()
  if &ft !~? 'vimfiler' && exists('*fugitive#head')
    return fugitive#head()
  endif
  return ''
endfunction

set updatetime=300
set re=1

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

" Filetypes
au BufNewFile,BufRead *.df, setf Dockerfile
au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx


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
nnoremap <Leader>fg :Rg <C-R><C-W><CR>
nnoremap <leader>n :nohl<CR>
nnoremap <Leader>fa :Neoformat<cr>
nmap <Leader>vn :NV!<cr>
nmap <Leader>vr :tabnew $MYVIMRC<cr>
nmap <Leader>so :source $MYVIMRC<cr>
nnoremap <Leader>tt :Ttoggle<cr>
vnoremap <Leader>ts :TREPLSendSelection<cr>
nnoremap <Leader>ts :TREPLSendLine<cr>
nnoremap <Leader>tn :TestNearest<cr>
nnoremap <Leader>tf :TestFile<cr>
nnoremap <Leader>tl :TestLast<cr>
map <Leader>yc :YankCode<cr>

" Plugin Settings
" fzf
nnoremap <C-p> :Files<cr>
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif
let g:fzf_preview_window = 'right:60%'
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

" HighlightYank
let g:highlightedyank_highlight_duration = 250

" vim wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" notational veloctiry
let g:nv_search_paths = ['~/vimwiki']

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

" vim-polyglot
let g:polyglot_disabled = ['typescript']

" fern.vim
nmap - :Fern . -reveal=%<cr>
nmap <C-n> :Fern . -drawer -width=50 -toggle<CR>
function! s:init_fern() abort
  " REALLY DO NOT WANT TO ADD MUCH INTO HERE BEYOND WHAT IS _NEEDED_
  " Unmap Ctrl-h for tmux split navigation
  unmap <buffer> <C-h>
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
nmap <silent> ga <Plug>(coc-codeaction)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gh <Plug>(coc-fix-current)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gn <Plug>(coc-rename)
set shortmess+=c

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
      \ 'coc-prettier',
      \ 'coc-solargraph',
      \ 'coc-sql',
      \ 'coc-tsserver'
      \ ]

" Splitjoin
let g:splitjoin_ruby_hanging_args = 0

" Closetag
let g:closetag_filetypes = 'html,xhtml,javascript,jsx,tsx'

" Vista
let g:vista_default_executive = 'coc'
let g:vista_executive_for = {
      \ 'vimwiki': 'markdown',
      \ 'markdown': 'toc',
      \ }
let g:vista_sidebar_width = 40
let g:vista#renderer#enable_icon = 0

" smoothie
" I want to speed it up
let g:smoothie_base_speed = 20
