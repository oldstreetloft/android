#!/bin/bash

main() {
        read -p "Enter FDroid query string: " APP_NAME
        fdroid_remove | sort | uniq | tee fdroid_new.plist
        printf "# Add FDroid query above this line." >> fdroid_new.plist
        mv fdroid_new.plist fdroid.plist
        rm -rf "Apks/$APP_NAME.apk"
}

fdroid_remove() {
        while IFS= read -r LINE; do
                [ "$LINE" != "$APP_NAME" ] && echo "$LINE"
        done < fdroid.plist
}

# Start execution
main