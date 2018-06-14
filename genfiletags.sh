#!/bin/sh
# Generate tag file for lookupfile plugin
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags
find . -regex '.*\.\(h\|c\|html\|asp\|js\|css\|def\|mk\|cfg\)' ! -path "*svn*" -type f -printf "%f\t%p\t1\n" | sort -f>> filenametags
