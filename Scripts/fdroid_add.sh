#!/bin/bash

main() {
        # Read app name for addition
        read -p "Enter FDroid query: " APP_NAME
        # Sort and write new plist
        fdroid_add | sort | uniq > fdroid_new.plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        mv fdroid_new.plist fdroid.plist
        printf "\nAdded $APP_NAME to fdroid.plist\n\n"
}

fdroid_add() {
        echo "$APP_NAME"
        cat fdroid.plist | sed '$d'
}

# Start execution
main