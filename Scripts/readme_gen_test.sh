#!/bin/bash

main() {
    # Download .apk from FDroid website useing fdroid.plist as the source
    printf "\nDownloading .apk files from FDroid:\n\n"
    fdroid_download || printf "\n\nERROR: Try changing the package name in Scripts/fdroid.plist\n\n"
    # Generate README.md from .apk in apk folder
    printf "\nWriting README.md:\n\n"
    write_readme | tee README.md ; echo
}

fdroid_download() {
    cat "fdroid.plist" | while read APP_NAME_RAW ; do
        # App name translations
        APP_NAME_PATH=$(echo $APP_NAME_RAW | sed 's/ //g')      # Remove whitespace for use in filename and README.md
        APP_NAME_URL=$(echo "$APP_NAME_RAW" | tr ' ' '+')       # Spaces to plus symbols for use in URLs
        # Search FDroid
        QUERY_FDROID=$(curl -sL "https://search.f-droid.org/?q=$APP_NAME_URL")
        # Parse Results for app page
        PARSE_QUERY=$(echo "$QUERY_FDROID" | grep package-header | grep -o 'href="[^"]*"' | sed 's/href="//;s/"$//' | head -n 1)
        # Fetch app page
        APP_PAGE=$(curl -sL "$PARSE_QUERY")
        # Parse app page results for URLs
        DOWN_URL=$(echo "$APP_PAGE" | tr " " "\n" | grep .apk | tail -n +2 | grep -o '".*"' | sed 's/"//g' | head -n 1)
        PNG_URL=$(echo "$APP_PAGE" | tr " " "\n" | grep .png | grep repo | grep content | grep -o '".*"' | sed 's/"//g' | head -n 1)
        # Print error
        [ -z "$DOWN_URL" ] && printf "\n\nERROR: $APP_NAME_PATH failed to query on F-Droid!\n\n"
        # Download apk
        printf "Downloading $APP_NAME_PATH.apk"
        curl -sL $DOWN_URL -o "Apks/$APP_NAME_PATH-TEST.apk" && printf " ✓\n" ; done
}

write_readme(){
    # Define apk folder
    url="https://github.com/oldstreetloft/android/raw/main/Apks/"
    # Write title
    echo "# Android Apks"
    # Write hyperlink
    find Apks/ -name "*.apk" | sort | while read apkfile ; do
        apkfile=$(echo $apkfile | cut -c 7-)                # hyperlink filename
        apkname=$(echo $apkfile | rev | cut -c 5- | rev)    # hyperlink displayname
        echo ; echo "*[$apkname]($url$apkfile)*" ; done     # hyperlink write
}

# Start execution
main