#!/bin/bash

main() {
        # Read app name for removal
        read -p "Enter app name for removal: " APP_NAME_RAW
        APP_NAME=$(echo $APP_NAME_RAW | sed 's/ //g')
        # Sort and write new plist
        fdroid_remove | sort | uniq > fdroid_new.plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        mv fdroid_new.plist fdroid.plist
        printf "\nRemoved $APP_NAME_RAW from fdroid.plist\n"
        # Remove apk
        rm -rf "Apks/$APP_NAME.apk"
        printf "\nRemoved $APP_NAME.apk\n\n"
}

fdroid_remove() {
        cat fdroid.plist | while read LINE; do
                [ "$LINE" != "$APP_NAME_RAW" ] && echo "$LINE" ; done
}

# Start execution
main