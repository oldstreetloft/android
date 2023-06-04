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
        while IFS= read -r LINE; do
                [ "$LINE" != "$APP_NAME" ] && echo "$LINE"
        done < fdroid.plist
}

# Start execution
main