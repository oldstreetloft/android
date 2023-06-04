#!/bin/bash

main() {
        read -p "Enter FDroid query string: " APP_NAME
        fdroid_add | sort | uniq | tee fdroid_new.plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        diff fdroid.plist fdroid_new.plist
        mv fdroid_new.plist fdroid.plist
}

fdroid_add() {
        # Read file line by line
        while IFS= read -r LINE; do
                # Compare the line with the app name
                if [[ "$LINE" = "$APP_NAME" ]]; then
                        exit 0
                else
                        echo "$LINE"
                fi
                echo "$APP_NAME"
        done < fdroid.plist
}

# Start execution
main