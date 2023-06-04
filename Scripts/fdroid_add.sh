#!/bin/bash

main() {
        read -p "Enter FDroid query string: " APP_NAME
        fdroid_add | tee fdroid_new.plist ; echo
        mv fdroid_new.plist fdroid.plist
}
fdroid_add() {
        # Read file line by line
        while IFS= read -r LINE; do
                # Compare the line with the app name
                if [[ "$LINE" != "$APP_NAME" ]]; then
                        echo "$LINE"
                else
                        echo "$LINE"
                fi
        done < fdroid.plist
        printf "# Add FDroid query above this line."
}

# Start execution
main