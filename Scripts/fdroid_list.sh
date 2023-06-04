#!/bin/bash

main() {
        printf "\nFDroid package list:\n\n"
        fdroid_list
}

fdroid_list() {
        cat fdroid.plist | sed '$d'
        echo
}

# Start execution
main