#!/bin/bash

main() {
        list_apks                               # List all .apk files
        list_fdroid                             # List all packages tracked by fdroid_download
}

list_apks() {
cat << ENDAPKS

Apk folder:

$(ls Apks/ | tr "\t" "\n" | sed 's/^/\t/g')
ENDAPKS
}

list_fdroid() {
cat << ENDFDROID

FDroid package list:

$(cat fdroid.plist | sed '$d' | sed 's/^/\t/g' ; echo)

ENDFDROID
}

# Start execution
main