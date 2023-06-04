#!/bin/bash

main() {
        read -p "Enter FDroid query string: " APP_NAME
        fdroid_add | sort | uniq | tee fdroid_new.plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        mv fdroid_new.plist fdroid.plist
}

fdroid_add() {
        # Read file line by line
        while IFS= read -r LINE; do
                echo "$LINE"
                echo "$APP_NAME"
        done < fdroid.plist
}

# Start execution
main