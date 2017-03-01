" .vimrc file by Jonas I. Liechti
" =======================
" Enjoy vim responsibly!
" =======================

" Reloading .vimrc
autocmd! bufwritepost .vimrc source %

" Enable the filetype plugin
filetype plugin on

" import dictionaries for auto completion
au FileType * exec("setlocal dictionary+=".$HOME."/src/vim/dictionaries/".expand('<amatch>'))
set complete+=k

" Even though I remapped the CapsLock and the Esc key this still useful
inoremap jj <Esc>

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

" set the auto completion to first complete as much as possible. A second tab
" will provide a list of options and a third tab will cycle through the
" options.
set wildmode=longest,list,full
set wildmenu
" vim-latex
" =========
" use pdflatex to compile .tex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'
let g:LatexBox_latexmk_options = "-pvc pdfps"
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_latexmk_async=1
" In case you like all search results to be highlighted uncomment the
" following line:
set hlsearch
" Search should not be case sensitive
set incsearch
set ignorecase
set smartcase
" now set the color
hi Search ctermfg=black

" clear the highlighted text with double esc
nnoremap <silent> <Esc><Esc> :noh<CR> :let @/=""<CR>

" use esc to clear the search highlighting
nnoremap <esc> :noh<return><esc>

" Spell check is always useful
hi clear SpellBad
set spell spelllang=en
hi SpellBad cterm=underline,bold

" Use the supertab plugin in 'context' mode
let g:SuperTabDefaultCompletionType = "context"
" Close preview popup upon choosing
let g:SuperTabClosePreviewOnPopupClose = 1

" No TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Somethings about code folding
" This will make it possible to use code folding manually with <zf>
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
" Save the view
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" If you like to see the line numbers:
set number
" Text wrapping       
set tw=0 " width of document 
set colorcolumn=80 
set wrap
highlight ColorColumn ctermbg=233 ctermfg=white
set formatoptions=l
set lbr

" I want *.py (and others) files to jump to the next line after a cw of 80
function! SetupEnv() 
    let l:path = expand('%:p') 
    if (&ft == 'python' || &ft == 'c') 
        setlocal tw=79 
        setlocal nowrap  
        setlocal fo-=t " dont wrap when typing 
    else 
        setlocal wrap 
    endif 
endfunction 
autocmd! BufReadPost,BufNewFile * call SetupEnv()

" In case you want to add a single character and leave the insert mode right after
" press s to insert single and S to append single. Note you can type 3s to
" insert 3 time the char that follows.
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" Time to rebind <Leader> key to something useful (and common) the ',':
let mapleader = ","

" to run python code
autocmd FileType python nnoremap <buffer> <Leader>x :exec '!python' shellescape(@%, 1)<cr>

" make it simpler to move around in windows:
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" shortcut to change the path
map <Leader>cd :exe "cd %:p:h"<CR>
map <Leader>lcd :exe "lcd %:p:h"<CR>

" Make it easy to copy to and paste from the clipboard
" vmap <Leader>y "*y
" map <Leader>yy "*yy
" vmap <Leader>Y "*Y
" map <Leader>p "*p
" map <Leader>P "*P
vmap <Leader>y "+y
map <Leader>yy "+yy
vmap <Leader>Y "+Y
map <Leader>p "+p
map <Leader>P "+P

" To navigate between tabs I use leader then h/l
map <Leader>th <esc>:tabprevious<CR>
map <Leader>tl <esc>:tabnext<CR>

" Easy way to resize windows
nnoremap <silent> <c-w>rl :exe "vertical resize +2"<CR>
nnoremap <silent> <c-w>rh :exe "vertical resize -2"<CR>
nnoremap <silent> <c-w>rj :exe "resize +2"<CR>
nnoremap <silent> <c-w>rk :exe "resize -2"<CR>

" better indentation: use > and < in visual mode
vnoremap < <gv
vnoremap > >gv

" Keep more
set history=700
set undolevels=700

" Load ctrlp
" ==========
set runtimepath^=~/src/vim/bundle/ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
" use leader s to start the search
let g:ctrlp_map = '<Leader>s'

" jedi-vim
" ========
" Configs
let g:jedi#usages_command = "<leader>z" 
let g:jedi#popup_on_dot = 0 
let g:jedi#popup_select_first = 0 
autocmd FileType python map <buffer> <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c> 
" map K to <Leader>i if the file is a python file (to see docstring)
autocmd FileType python map <buffer> <Leader>i K


" Better navigating through omnicomplete option list 
" See 
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone 
function! OmniPopup(action) 
    if pumvisible() 
        if a:action == 'j' 
            return "\<C-N>" 
        elseif a:action == 'k' 
            return "\<C-P>" 
        endif 
    endif 
    return a:action 
endfunction 
inoremap <silent><C-j> <C-R>=OmniPopup('j')<cr> 
inoremap <silent><C-k> <C-R>=OmniPopup('k')<cr> 

" nerdtree
" ========
" nerdtree-tabs
" Open nerdtree-tab on starup of vim
let g:nerdtree_tabs_open_on_console_startup = 1
" Focus nerdtree on file/folder when opening
let g:nerdtree_tabs_smart_startup_focus = 1
" leader n toggles nerdtree
map <Leader>n <esc>:NERDTreeMirrorToggle<CR>

" nerd-commenter
" ==============
" Add a space after comment delimiters
let g:NERDSpaceDelims = 1
" Also comment empty lines in the bock
let g:NERDCommentEmptyLines = 1
" Trim trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" The default settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" possibility to use several checkers
let g:syntastic_aggregate_errors = 1
" let g:syntastic_tex_checkers=['chktex', 'proselint']
" custom command to use the proselint checker
nnoremap <silent> <Leader>pc :exe "SyntasticCheck proselint"<CR>
