#!/bin/sh

# Confgure your favorite diff program here.
DIFF="/usr/bin/vimdiff"

# Subversion provides the paths we need as the sixth and seventh parameters.

LEFT=${6}
RIGHT=${7}

# Call the dif command
$DIFF $LEFT $RIGHT

# Change your $HOME/.subversion/config file to point at this script
# diff-cmd = /home/xxxx/.vim/shell/diffwrap.sh
