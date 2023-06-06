#!/bin/bash

main() {
        # Download .apk from FDroid website using fdroid.plist as source, inform user of non-existant app
        printf "\nDownloading apks from FDroid:\n\n"
        cat "fdroid.plist" | while read APP_NAME_RAW ; do           # Itterate through each app in fdroid.plist
                fdroid_download ; done
}

fdroid_download() {
        # Format app names
        APP_NAME_PATH=$(echo $APP_NAME_RAW | sed 's/ //g')      # Remove space for use in filename and README.md
        APP_NAME_URL=$(echo "$APP_NAME_RAW" | tr ' ' '+')       # Translates space into plus for use in URLs
        # Fetch FDroid search results to variable
        QUERY_FDROID=$(curl -sL "https://search.f-droid.org/?q=$APP_NAME_URL")
        # Parse Results for app page
        PARSE_QUERY=$(echo "$QUERY_FDROID" | grep package-header | grep -o 'href="[^"]*"' | sed 's/href="//;s/"$//' | head -n 1)
        # Fetch app page results to a variable
        APP_PAGE=$(curl -sL "$PARSE_QUERY")
        # Parse app page results for URLs
        DOWN_URL=$(echo "$APP_PAGE" | tr " " "\n" | grep .apk | tail -n +2 | grep -o '".*"' | sed 's/"//g' | head -n 1)
        PNG_URL=$(echo "$APP_PAGE" | tr " " "\n" | grep .png | grep repo | grep content | grep -o '".*"' | sed 's/"//g' | head -n 1)
        # Inform user about non-existant app
        [ -z "$DOWN_URL" ] && printf "\n\nERROR: $APP_NAME_PATH failed to query on F-Droid!\n\n"
        # Download apk to apk folder, check for success
        printf "$APP_NAME_PATH"
        curl -sL $DOWN_URL -o "Apks/$APP_NAME_PATH.apk" && printf " ✓\n"
}

# Start execution
clear
main