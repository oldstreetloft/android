#!/bin/bash

main() {
        # Read app name for addition
        read -p "Enter FDroid query with spaces: " APP_NAME
        # Sort and write new plist
        fdroid_add | sort | uniq > fdroid_new.plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        mv fdroid_new.plist fdroid.plist
}

fdroid_add() {
        echo "$APP_NAME"
        cat fdroid.plist | sed '$d'
}

# Start execution
main