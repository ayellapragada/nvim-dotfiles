# README

## Instructions

Ideally this one will be as easy as git pull and the after commit hooks should set things up. But until then the instructions are here for the exact details.

##  Required Setup
- None, hopefully I can keep it all in my vimrc.

## Next steps
- Set leader key maps for whatever I need for neoterm, having ability to send code directly to a rails console is amazing.

## Things to keep inmind
- [m and ]m to hop between method definitions.
- ir / ar (in or around ruby block, and repeat to expand or collapse it)
- im / am for ruby methods
- :%normal .   for using normal on a large block of visual mode
- <C-f> switch from command-line mode to command-line window
- USE MARKS HOLY m{a-zA-Z} and then `{mark}
- quickfix list usage

- EASY PLUGINS
cr{opt} for abolish
g> and g< to swap args
- sa{motion/textobject}{addition} / sd{deletion} / sr{deletion}{addition}
nnoremap <Leader>tt :Ttoggle<cr>
vnoremap <Leader>ts :TREPLSendSelection<cr>
nnoremap <Leader>ts :TREPLSendLine<cr>
nnoremap <Leader>tn :TestNearest<cr>
nnoremap <Leader>tf :TestFile<cr>
nnoremap <Leader>tl :TestLast<cr>
nnoremap <Leader>tv :TestVisit<cr>
