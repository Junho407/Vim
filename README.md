## Personalize vim to become a vim master

### Update .bashrc
  export CSCOPE_EDITOR=vim  
  export CSCOPE_DIR=$PWD/project  
  export CSCOPE_DB=$CSCOPE_DIR/cscope.out  
  export PATH=$PATH:~/.vim/shell  
#### Note: please source .bashrc again or relogin to update environment variable.
### Put script files to shell directory
Put  genscope.sh and genfiletag.sh to /.vim/shell  
If the directory "shell" is not exist, please create this file   


### Modified .vimrc
nmap <F9>  :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q.")<CR>  
nmap <F10> :!cscope -2_cli -i tap0 save_configbqi $CSCOPE_DIR/cscope.files -f $CSCOPE_DB<CR>:cs add $CSCOPE_DB<CR>:cs reset<CR><CR>  
nmap <F11> :call RunShell("Generate cscope file & lookup filename tags", "gencscope.sh && genfiletags.sh")<CR>  

if filereadable("./filenametags")  
     let g:LookupFile_TagExpr = '"./filenametags"'  
endif  
