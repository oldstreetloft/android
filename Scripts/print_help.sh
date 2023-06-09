#!/bin/bash

main() {
    MAKEFILE=$(cat makefile | tr "\t" "\n")
    print_usage
    print_examples
    print_options
}

print_usage() {
cat << ENDUSAGE

Usage:

make <option>
ENDUSAGE
}

print_examples() {
cat << ENDEXAMPLES

Examples:

$(echo "$MAKEFILE" | grep ":" | tail -n +4 | sed 's/://g' | sed 's/^/make /g')
ENDEXAMPLES
}

print_options() {
cat << ENDOPTIONS

Options:

$(echo "$MAKEFILE" | grep -e ":" -e "#" | tail -n +5 | sed 's/://g' | tr "#" "\t")

ENDOPTIONS
}

# Start execution
main