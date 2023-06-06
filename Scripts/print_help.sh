#!/bin/bash

main() {
    printf "\nUsage:\n\n"
    grep ":" makefile | tail -n +4 | sed 's/://g' | sed 's/^/make /g'
    printf "\nOptions:\n\n"
    cat makefile | tr "\t" "\n" | grep -e ":" -e "#" | tail -n +5 | tr "#" "\t"
}

# Start execution
main