#!/bin/bash

main() {
        # Read app name for addition
        read -p "Enter FDroid query to add to app list: " APP_NAME
        # Sort and write to new plist
        fdroid_add | sort | uniq > fdroid_new.plist
        # Write last line to new plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        # Overwrite plist
        mv fdroid_new.plist fdroid.plist
        # Inform user of changes
        printf "\nAdded $APP_NAME to fdroid.plist\n\n"
}

fdroid_add() {
        # Print app name
        echo "$APP_NAME"
        # Print plist without last line
        cat fdroid.plist | sed '$d'
}

# Start execution
clear
main