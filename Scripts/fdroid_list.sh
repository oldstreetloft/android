#!/bin/bash

main() {
        printf "\nApk list:\n"
        ls -l Apks | awk '{print $9}'
        printf "\nFDroid package list:\n\n"
        cat fdroid.plist | sed '$d' ; echo
}

# Start execution
main