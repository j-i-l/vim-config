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

" set the autocompletion to first complete as much as possible. A second tab
" will provide a list of options and a third tab will cycle through the
" options.
set wildmode=longest,list,full
set wildmenu
" use pdflatex to compile .tex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
let g:LatexBox_latexmk_options = "-pvc pdfps"
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_latexmk_async=1
