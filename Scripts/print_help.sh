#!/bin/bash

main() {
printf "\nUsage:\n\nmake\n"
grep ":" makefile | tail -n +4 | sed 's/://g' | sed 's/^/make /g'
printf "\nDefault action:\n\nUpdates FDroid apps, generates new README.md, and commits all changes\n\n"
}

# Start execution
main