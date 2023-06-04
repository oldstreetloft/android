#!/bin/bash

main() {
        printf "\nFDroid package list:\n\n"
        fdroid_list
        echo
}

fdroid_list() {
        cat fdroid.plist | sed '$d'
}

# Start execution
main