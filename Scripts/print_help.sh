#!/bin/bash

main() {
    MAKEFILE=$(cat makefile | tr "\t" "\n")
    printf "\nUsage:\n\n"
    printf "make <option>\n"
    printf "\nOptions:\n\n"
    echo "$MAKEFILE" | grep -e ":" -e "#" | tail -n +5 | sed 's/://g' | tr "#" "\t"
    printf "\nExamples:\n\n"
    echo "$MAKEFILE" | grep ":" | tail -n +4 | sed 's/://g' | sed 's/^/make /g'
    echo
}

# Start execution
main