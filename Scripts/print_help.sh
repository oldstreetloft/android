#!/bin/bash

main() {
    MAKEFILE=$(cat makefile | tr "\t" "\n")
    print_usage
    print_options
    print_examples
}

print_usage() {
    print_line
    printf "Usage:\n\n"
    printf "make <option>\n"
}

print_options() {
    print_line
    printf "Options:\n\n"
    echo "$MAKEFILE" | grep -e ":" -e "#" | tail -n +5 | sed 's/://g' | tr "#" "\t"
}

print_examples() {
    print_line
    printf "Examples:\n\n"
    echo "$MAKEFILE" | grep ":" | tail -n +4 | sed 's/://g' | sed 's/^/make /g'
    print_line
}

print_line() {
    printf "================================================================================\n"
}

# Start execution
main