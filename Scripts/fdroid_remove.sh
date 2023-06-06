#!/bin/bash

main() {
        # Read app name for removal
        read -p "Enter app name to be removed: " APP_NAME_RAW
        APP_NAME=$(echo $APP_NAME_RAW | sed 's/ //g')
        # Sort and write to new plist
        fdroid_remove | sort | uniq > fdroid_new.plist
        # Write last line to new plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        # Overwrite plist
        mv fdroid_new.plist fdroid.plist
        # Inform user of changes
        printf "\nRemoved $APP_NAME_RAW from fdroid.plist\n"
        # Remove apk
        rm -rf "Apks/$APP_NAME.apk"
        printf "\nRemoved $APP_NAME.apk\n\n"
}

fdroid_remove() {
        cat fdroid.plist | while read LINE; do
                # Iterate through plist and print all except one we are removing
                [ "$LINE" != "$APP_NAME_RAW" ] && echo "$LINE" ; done
}

# Start execution
clear
main