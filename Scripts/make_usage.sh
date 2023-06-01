#!/bin/bash

cat << EOF

USAGE:
make <option>

OPTIONS:
EOF

# Lists all make targets
tail -n +4 makefile | grep ':' | grep -v "echo" | sed 's/://g' | sed '$d'

cat << EOF

TLDR:
make update

EOF