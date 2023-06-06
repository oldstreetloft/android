#!/bin/bash
source Scripts/print_line.sh

main() {
        print_line
        list_apks                       # List all .apk files
        print_line
        list_fdroid                     # List all packages tracked by fdroid_download
        print_line
}

list_apks() {
        printf "Apk folder:\n\n"
        ls Apks/ | tr "\t" "\n"
}

list_fdroid() {
        printf "FDroid package list:\n\n"
        cat fdroid.plist | sed '$d'
}

# Start execution
main