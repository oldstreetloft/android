#!/bin/bash

cat << EOF

USAGE:
make <option>

OPTIONS:
EOF
awk 'NR==4' makefile | tr ' ' '\n' | sed 's/all:\t\t//g'
echo