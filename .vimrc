" .vimrc file by Jonas I. Liechti
" =======================
" Enjoy vim responsively!
" =======================

" Load the plugins with pathogen
execute pathogen#infect('bundle/{}', '~/src/vim/bundle/{}')

" vim-airline
" ===========
" display buffers if only 1 tab is open
let g:airline#extension#tabline#enabled = 1
" set the theme
let g:airline_theme='luna'
" adapt colors
set t_Co=256
