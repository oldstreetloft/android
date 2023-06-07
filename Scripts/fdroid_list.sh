#!/bin/bash

main() {
        clear
        list_apks                       # List all .apk files
        list_fdroid                     # List all packages tracked by fdroid_download
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