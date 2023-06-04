#!/bin/bash

main() {
        # Read app name for addition
        read -p "Enter FDroid query string: " APP_NAME
        # Sort and write new plist
        printf "\nFDroid package list:\n\n"
        fdroid_add | sort | uniq | tee fdroid_new.plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        mv fdroid_new.plist fdroid.plist
        printf "\nAdded $APP_NAME\n"

}

fdroid_add() {
        echo "$APP_NAME"
        while IFS= read -r LINE; do
                echo "$LINE"
        done < fdroid.plist
}

# Start execution
main