#!/bin/bash

main() {
        list_apks
        list_fdroid
}

list_apks() {
        printf "\nApk folder:\n\n"
        ls Apks/ | tr "\t" "\n"
}

list_fdroid() {
        printf "\nFDroid package list:\n\n"
        cat fdroid.plist | sed '$d' ; echo
}

# Start execution
main