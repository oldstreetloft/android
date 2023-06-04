#!/bin/bash

main() {
    printf "\nUsage:\n\n"
    grep ":" makefile | tail -n +4 | sed 's/://g' | sed 's/^/make /g'
    echo
}

# Start execution
main