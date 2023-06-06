#!/bin/bash

main() {
    MAKEFILE=$(cat makefile | tr "\t" "\n")
    print_line
    print_usage
    print_line
    print_options
    print_line
    print_examples
    print_line
}

print_usage() {
    printf "Usage:\n\n"
    printf "make <option>\n"
}

print_options() {
    printf "Options:\n\n"
    echo "$MAKEFILE" | grep -e ":" -e "#" | tail -n +5 | sed 's/://g' | tr "#" "\t"
}

print_examples() {
    printf "Examples:\n\n"
    echo "$MAKEFILE" | grep ":" | tail -n +4 | sed 's/://g' | sed 's/^/make /g'
}

print_line() {
    printf "\n================================================================================\n\n"
}

# Start execution
main