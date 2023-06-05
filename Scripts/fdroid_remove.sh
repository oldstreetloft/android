#!/bin/bash

main() {
        # Read app name for removal
        read -p "Enter FDroid query: " APP_NAME
        # Sort and write new plist
        fdroid_remove | sort | uniq > fdroid_new.plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        mv fdroid_new.plist fdroid.plist
        # Remove apk
        rm -rf "Apks/$APP_NAME.apk"
        printf "\nRemoved $APP_NAME\n"
}

fdroid_remove() {
        cat fdroid.plist | while read LINE; do
                [ "$LINE" != "$APP_NAME" ] && echo "$LINE" ; done
}

# Start execution
main