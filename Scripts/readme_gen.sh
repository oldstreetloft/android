#!/bin/bash

main() {
    printf "\nDownloading .apk files from FDroid:\n\n"
    fdroid_download || printf "\n\nERROR: Try changing the package name in Scripts/fdroid.plist\n\n"
    
    printf "\nWriting README.md:\n\n"
    write_readme | tee README.md ; echo
}

fdroid_download() {
    cat "fdroid.plist" | while read APP_NAME_RAW ; do
        # App name translations
        APP_NAME_PATH=$(echo $APP_NAME_RAW | sed 's/ //g')
        APP_NAME_URL=$(echo "$APP_NAME_RAW" | tr ' ' '+')
        # Search FDroid
        QUERY_FDROID=$(curl -sL "https://search.f-droid.org/?q=$APP_NAME_URL")
        PARSE_QUERY=$(echo "$QUERY_FDROID" | grep package-header | grep -o 'href="[^"]*"' | sed 's/href="//;s/"$//' | head -n 1)
        APP_PAGE=$(curl -sL "$PARSE_QUERY")
        # Define URLs
        DOWN_URL=$(echo "$APP_PAGE" | tr " " "\n" | grep .apk | tail -n +2 | grep -o '".*"' | sed 's/"//g' | head -n 1)
        PNG_URL=$(echo "$APP_PAGE" | tr " " "\n" | grep .png | grep repo | grep content | grep -o '".*"' | sed 's/"//g' | head -n 1)
        # Check URL and Download .apk
        [ -z "$DOWN_URL" ] && printf "\n\nERROR: $APP_NAME_PATH failed to query on F-Droid!\n\n"
        printf "Downloading $APP_NAME_PATH.apk"
        curl -sL $DOWN_URL -o "Apks/$APP_NAME_PATH.apk" && printf " ✓\n" ; done
}

write_readme(){
    url="https://github.com/oldstreetloft/android/raw/main/Apks/"

    echo "# Android Apks\n"

    find Apks/ -name "*.apk" | sort | while read apkfile ; do
        apkfile=$(echo $apkfile | cut -c 7-)
        apkname=$(echo $apkfile | rev | cut -c 5- | rev)
        echo ; echo "*[$apkname]($url$apkfile)*" ; done
}

main