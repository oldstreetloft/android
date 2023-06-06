#!/bin/bash

main() {
        print_line
        list_apks
        print_line
        list_fdroid
        print_line
}

list_apks() {
        printf "\nApk folder:\n\n"
        ls Apks/ | tr "\t" "\n" ; echo
}

list_fdroid() {
        printf "\nFDroid package list:\n\n"
        cat fdroid.plist | sed '$d' ; echo
}

print_line() {
    printf "================================================================================\n"
}

# Start execution
main