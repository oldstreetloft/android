#!/bin/bash

main() {
    printf "\nUsage:\n\n"
    printf "make <option>\n"
    printf "\nOptions:\n\n"
    cat makefile | tr "\t" "\n" | grep -e ":" -e "#" | tail -n +5 | sed 's/://g' | tr "#" "\t"
    printf "\nExamples:\n\n"
    grep ":" makefile | tail -n +4 | sed 's/://g' | sed 's/^/make /g'
    echo
}

# Start execution
main