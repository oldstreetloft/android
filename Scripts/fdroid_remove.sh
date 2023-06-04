#!/bin/bash

main() {
        read -p "Enter FDroid query string: " APP_NAME
        fdroid_remove | sort | uniq | tee fdroid_new.plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        mv fdroid_new.plist fdroid.plist
        rm -rf "Apks/$APP_NAME.apk"
}

fdroid_remove() {
        # Read file line by line
        while IFS= read -r LINE; do
                # Compare the line with the app name
                if [[ "$LINE" != "$APP_NAME" ]]; then
                        echo "$LINE"
                fi
        done < fdroid.plist
}

# Start execution
main