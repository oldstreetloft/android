#!/bin/bash

main() {
    MAKEFILE=$(cat makefile | tr "\t" "\n")
    print_usage
    print_options
    print_examples
    echo
}

print_usage() {
    printf "\nUsage:\n\n"
    printf "make <option>\n"
}

print_options() {
    printf "\nOptions:\n\n"
    echo "$MAKEFILE" | grep -e ":" -e "#" | tail -n +5 | sed 's/://g' | tr "#" "\t"
}

print_examples() {
    printf "\nExamples:\n\n"
    echo "$MAKEFILE" | grep ":" | tail -n +4 | sed 's/://g' | sed 's/^/make /g'
}

# Start execution
main