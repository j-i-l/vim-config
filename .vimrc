" .vimrc file by Jonas I. Liechti
" =======================
" Enjoy vim responsibly!
" =======================

" Reloading .vimrc
autocmd! bufwritepost .vimrc source %

" Eventhough I remapped the CapsLock and the Esc key this still useful
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

" set the autocompletion to first complete as much as possible. A second tab
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
" Search should be case insensitive
set incsearch
set ignorecase
set smartcase

" Use the supertab plugin in 'context' mode
let g:SuperTabDefaultCompletionType = "context"
" Close preview popup upon choosing
let g:SuperTabClosePreviewOnPopupClose = 1

" No TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" If you like to see the line numbers:
set number
" Text wrapping                                                                 
set tw=79 " width of document                                                   
set colorcolumn=80                                                              
set wrap
highlight ColorColumn ctermbg=233                                               
" I want *.py (and others) files to jump to the next line after a cw of 80.     
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

" Time to rebind <Leader> key to something useful (and common) the ',':
let mapleader = ","

" to run python code
autocmd FileType python nnoremap <buffer> <Leader>x :exec '!python' shellescape(@%, 1)<cr>

" make it simpler to move around in windows:
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" To navigate between tabs I use leader then h/l
map <Leader>h <esc>:tabprevious<CR>
map <Leader>l <esc>:tabnext<CR>

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
