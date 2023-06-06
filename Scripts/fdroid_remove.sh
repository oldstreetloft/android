#!/bin/bash

main() {
        # Read app name for removal
        read -p "Enter FDroid query: " APP_NAME_RAW
        APP_NAME=$(echo $APP_NAME_RAW | sed 's/ //g')
        # Sort and write new plist
        fdroid_remove | sort | uniq > fdroid_new.plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        mv fdroid_new.plist fdroid.plist
        # Remove apk
        printf "\nRemoved $APP_NAME_RAW from fdroid.plist\n"
        rm -rf "Apks/$APP_NAME.apk"
        printf "\nRemoved $APP_NAME.apk\n\n"
}

fdroid_remove() {
        cat fdroid.plist | while read LINE; do
                [ "$LINE" != "$APP_NAME_RAW" ] && echo "$LINE" ; done
}

# Start execution
main