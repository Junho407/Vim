find $PWD -name "*.c" -o -name "*.h" -o -name "*.asp" -o -name "*.js" -o -name "*.cfg" > cscope.files
cscope -Rbqk -i $PWD/cscope.files
echo -n "."
mv cscope.* $CSCOPE_DIR
echo  "Done!"
ls $CSCOPE_DIR
date
