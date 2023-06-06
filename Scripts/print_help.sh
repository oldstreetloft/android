#!/bin/bash

main() {
    MAKEFILE=$(cat makefile | tr "\t" "\n")
    print_usage
    print_examples
    print_options
    echo
}

print_usage() {
    printf "\nUsage:\n\n"
    printf "make <option>\n"
}

print_examples() {
    printf "\nExamples:\n\n"
    echo "$MAKEFILE" | grep ":" | tail -n +4 | sed 's/://g' | sed 's/^/make /g'
}

print_options() {
    printf "\nOptions:\n\n"
    echo "$MAKEFILE" | grep -e ":" -e "#" | tail -n +5 | sed 's/://g' | tr "#" "\t"
}

# Start execution
clear
main