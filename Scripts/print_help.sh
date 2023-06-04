#!/bin/bash

main() {
    printf "\nUsage:\n\nmake\n"
    print_targets
    printf "\nDefault action:\n\nUpdates FDroid apps, generates new README.md, and commits all changes\n\n"
}

print_targets() {
    grep ":" makefile | tail -n +4 | sed 's/://g' | sed 's/^/make /g'
}

# Start execution
main