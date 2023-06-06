#!/bin/bash

main() {
        printf "\nApk folder:\n\n"
        ls Apks/ | tr "\t" "\n"
        printf "\nFDroid package list:\n\n"
        cat fdroid.plist | sed '$d' ; echo
}

# Start execution
main