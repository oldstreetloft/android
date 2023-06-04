#!/bin/bash

main() {
    printf "\nUsage:\n\n"
    print_targets
}

print_targets() {
    grep ":" makefile | tail -n +4 | sed 's/://g' | sed 's/^/make /g'
    echo
}

# Start execution
main