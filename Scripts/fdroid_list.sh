#!/bin/bash

main() {
        printf "\nFDroid package list:\n\n"
        cat fdroid.plist | sed '$d'
        echo
}

# Start execution
main