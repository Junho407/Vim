#!/bin/sh

rm cscope.*
find . -name "*.c" -o -name "*.h" -o -name "*.asp" -o -name "*.js" -o -name "*.html"  > cscope.files
cscope -Rb -i cscope.files
