set nocompatible    "be iMproved, required
filetype off        "required
"map <f9> :Tlist<CR>
" set the runtime path to include Vundle and initialize

filetype plugin indent on    "required

function! RunShell(Msg, Shell)
    echo a:Msg.'...'
    call system(a:Shell)
    echo 'done'
endfunction


call te#feat#feat_enable('g:feat_enable_basic', 1)
call te#feat#feat_enable('g:feat_enable_airline', 1)
call te#feat#feat_enable('g:feat_enable_gui', 1)

"" set leader key <leader>
let mapleader = "\<Space>"
" [ PLUGINS    ] =================================================
" pathogen ----------------------------------------------------{{{2
execute pathogen#infect()
filetype plugin indent on " required
" Source Explorer(srcExpl) ------------------------------------{{{2
" Tagbar  -----------------------------------------------------{{{2
nmap <F8> :TagbarToggle<CR>
" Taglist  ----------------------------------------------------{{{2
nnoremap <F3> :TlistToggle<CR>
"  Nerdtree ---------------------------------------------------{{{2
nnoremap <F2> :NERDTreeToggle<CR>
" " Generate filename tags ------------------------------------{{{2
nmap <F9>  :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q.")<cr>
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

" Set left separator
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
" the separator used on the left side
let g:airline_left_sep='▶'
" the separator used on the right side
let g:airline_right_sep='◀'
" themes are automatically selected based on the matching colorscheme. this
" can be overridden by defining a value
" Always show the status line
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h24 "config font for vim
"set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h28 "config font for vim
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

function! te#utils#tab_buf_switch(num) abort
    if exists('g:feat_enable_airline') && g:feat_enable_airline == 1
        execute 'normal '."\<Plug>AirlineSelectTab".a:num
    else
        if exists( '*tabpagenr' ) && tabpagenr('$') != 1
            Tab support && tabs open
            execute 'normal '.a:num.'gt'
        else
            let l:temp=a:num
            let l:buf_index=a:num
            let l:buf_count=len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
            if l:temp > l:buf_count
                return
            endif
            while l:buf_index != 0
                while !buflisted(l:temp)
                    let l:temp += 1
                endw
                let l:buf_index -= 1
                if l:buf_index != 0
                    let l:temp += 1
                endif
            endw
            execute ':'.l:temp.'b'
        endif
    endif
endfunction

"" Key binding
"" tab or buf 1
nnoremap <leader>1 :call te#utils#tab_buf_switch(1)<cr>
"" tab or buf 2
nnoremap <leader>2 :call te#utils#tab_buf_switch(2)<cr>
"" tab or buf 3
nnoremap <leader>3 :call te#utils#tab_buf_switch(3)<cr>
"" tab or buf 4
nnoremap <leader>4 :call te#utils#tab_buf_switch(4)<cr>
"" tab or buf 5
nnoremap <leader>5 :call te#utils#tab_buf_switch(5)<cr>
"" tab or buf 6
nnoremap <leader>6 :call te#utils#tab_buf_switch(6)<cr>
"" tab or buf 7
nnoremap <leader>7 :call te#utils#tab_buf_switch(7)<cr>
"" tab or buf 8
nnoremap <leader>8 :call te#utils#tab_buf_switch(8)<cr>
"" tab or buf 9
nnoremap <leader>9 :call te#utils#tab_buf_switch(9)<cr>
"" tab or buf Previous/Next
nmap <Leader>p <Plug>AirlineSelectPrevTab       
nmap <Leader>n <Plug>AirlineSelectNextTab  

" tabline
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
" ,o - Open new document
nnoremap <Leader>o :CtrlP<CR>a

" [ VIM EDITOR ] ==============================================
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


" map hotkey ciw <C-R> 0 <Esc> replace the word and press '.' to repeat 
map <leader>rr ciw<C-r>0<Esc>
set cscopetag
set csto=0

set cscopeverbose
