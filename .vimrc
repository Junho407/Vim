set nocompatible    "be iMproved, required
syntax on
filetype off       "required
" Set Vundle and initialize related runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'gnattishness/cscope_maps'
" Install Git toolkit
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
" Install NERDTree package"
Plugin 'scrooloose/nerdtree'
" Install Taglist "
Plugin 'taglist.vim'
" Install NERDTree Tabs package "
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'tracyone/vinux'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/Mark--Karkat' 
Plugin 'vim-scripts/OmniCppComplete' 
Plugin 'kshenoy/vim-signature' 
" Colorscheme 
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'sickill/vim-monokai'
Plugin 'skielbasa/vim-material-monokai'
" Lookup file
Plugin 'genutils'
Plugin 'lookupfile'
call vundle#end() "Required
filetype plugin indent on    "required

function! RunShell(Msg, Shell)
    echo a:Msg.'...'
    call system(a:Shell)
    echo 'done'
endfunction

" set leader key <leader>
let mapleader = "\<Space>"

call te#feat#feat_enable('g:feat_enable_basic', 1)
call te#feat#feat_enable('g:feat_enable_airline', 1)
call te#feat#feat_enable('g:feat_enable_gui', 1)

" [ PLUGINS    ] =================================================
"  Nerdtree ---------------------------------------------------{{{2
nnoremap <F2> :NERDTreeToggle<CR>
"  Taglist  ---------------------------------------------------{{{2
nnoremap <F3> :TlistToggle<CR>
" Tagbar  -----------------------------------------------------{{{2
" -----  <F5> :Lookup file used -------------------------------{{{2
nmap <F8> :TagbarToggle<CR>
" Taglist  ----------------------------------------------------{{{2

" Generate filename tags ------------------------------------{{{2
nmap <F9>  :call RunShell("Generate tags", "rm -fr tags && ctags --langmap=c:.c.h --languages=c -R --exclude=@.ctagsignore --fields=+iaS --extra=+q --sort=yes")<cr>
nmap <F10> :!cscope -bqi $CSCOPE_DIR/cscope.files -f $CSCOPE_DB<CR>:cs add $CSCOPE_DB<CR>:cs reset<CR><CR>
nmap <F11> :call RunShell("Generate cscope file and lookup filename tags", "gencscope.sh && genfiletags.sh")<cr>

" Lookupfile  ----------------------------------------------------{{{2
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
if filereadable("./filenametags" )
    let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent><leader>lk :LUTags<cr>
nmap <silent><leader>ll :LUBufs<cr>
nmap <silent><leader>lw :LUWalk<cr>

" Airline -----------------------------------------------------{{{2
set laststatus=0
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#bufer_nr_show = 0 " Show bufer number
let g:airline#extensions#tabline#fnametruncate = 16 " Show bufer number
let g:airline#extensions#tabline#fnamecollapse = 2  " Show bufer number
let g:airline#extensions#tabline#buffer_idx_mode = 1 "  * enable/disable displaying index of the buffer.
    

" Set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '' 
let g:airline#extensions#tabline#right_alt_sep = '' 
let g:airline#extensions#tagbar#enabled = 1
"* change how tags are displayed (:help tagbar-statusline) > 
"let g:airline#extensions#tagbar#flags = ''  (default)
"let g:airline#extensions#tagbar#flags = 'f'
"let g:airline#extensions#tagbar#flags = 's'
"let g:airline#extensions#tagbar#flags = 'p'

"* enable/disable detection of whitespace errors. >      
"let g:airline#extensions#whitespace#enabled = 1

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h24 "config font for vim
"set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h28 "config font for vim
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" Key binding
" tab or buf 1
nmap <leader>1 <Plug>AirlineSelectTab1
" tab or buf 2
nmap <leader>2 <Plug>AirlineSelectTab2
" tab or buf 3 <Plug>AirlineSelectTab3
nmap <leader>3 <Plug>AirlineSelectTab3
" tab or buf 4 <Plug>AirlineSelectTab4
nmap <leader>4 <Plug>AirlineSelectTab4
" tab or buf 5 <Plug>AirlineSelectTab5
nmap <leader>5 <Plug>AirlineSelectTab5
" tab or buf 6 <Plug>AirlineSelectTab6
nmap <leader>6 <Plug>AirlineSelectTab6
" tab or buf 7 <Plug>AirlineSelectTab7
nmap <leader>7 <Plug>AirlineSelectTab7
" tab or buf 8 <Plug>AirlineSelectTab8
nmap <leader>8 <Plug>AirlineSelectTab8
" tab or buf 9 <Plug>AirlineSelectTab9
nmap <leader>9 <Plug>AirlineSelectTab9
" tab or buf previous/next
nmap <leader>pp <Plug>AirlineSelectPrevTab
nmap <leader>nn <Plug>AirlineSelectNextTab
"" tab or buf Previous/Next

" Tabline -----------------------------------------------------{{{2
" Always display tab page
"set showtabline=2
" GUI use pure text to display tab page
set guioptions-=m  " add menu bar
set guioptions+=l  " add menu bar
set guioptions+=b  " add menu bar
set guioptions-=T  " remove tool bar
set guioptions-=r  " remove right-hand scroll bar(Right of split window)
set guioptions-=R  " remove right-hand scroll bar
set guioptions-=l  " remove left-hand scroll bar(Left of split windows)
set guioptions-=L  " remove left-hand scroll bar
set guioptions-=e  " add Tab-page

" Colorscheme -------------------------------------------------{{{2
" Colorscheme 1: [Papercolor]
set t_Co=256   " This is may or may not need
set background=dark
colorscheme PaperColor

" [seoul256(dark)]
" Range: 233 (darkest) ~ 239 (lightest)
" Default: 237
let g:seoul256_background = 235
colorscheme seoul256

" Colorscheme 2:[seould256(light)]
" Range: 252(darkest) ~ 256 (lightest)
" Default: 253
let g:seoul256_light_background = 252
colorscheme seoul256-light

" switch background mode
set background=dark

" ,q - close document
nnoremap <Leader>q :q!<CR>
" ,s - Save document
nnoremap <Leader>s :w<CR>
" ,x - Open new document
nnoremap <Leader>x :qa!<CR>

" [ VIM EDITOR ] ==============================================
set omnifunc=syntaxcomplete#Complete
syntax on
set ruler
set showmode
" show line number
set nu
set hlsearch
set smartindent
" tabstop size 
set tabstop=4
" Acknowledge C or Java language and use C format to process indent >> <<
set cindent shiftwidth=4
" use space to replace when using tab key
set expandtab
set nowrap
set ut=100

if has("autocmd")
        filetype on
        autocmd Filetype html,aspvbs,javascript,xml setlocal ts=2 sts=2 sw=2 expandtab
endif
set ic
set backspace=2
set history=100
" enable or disable mouse use
nnoremap <F6> :call ToggleMouse() <CR>
function! ToggleMouse()
       if &mouse == 'a'
           set mouse=
           set nonumber
           echo "Mouse usage disabled"
       else
           set mouse=a
           set number
           echo "Mouse usage enabled"
       endif
endfunction
"" search result at center
nnoremap N nzz
nnoremap n nzz
"" ESC mapping
inoremap jk <ESC>
"" tab switch
nnoremap <C-h> gT
nnoremap <C-l> gt
"" adjust window size
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap <RIGHT> <C-W><
nnoremap <LEFT> <C-W>>
