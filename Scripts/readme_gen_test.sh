#!/bin/bash

main() {
    fdroid_download || printf "\n\nERROR: Try changing the package name in Scripts/fdroid.plist\n\n"
    write_readme > README.md
}

write_readme(){
    url="https://github.com/oldstreetloft/android/raw/main/Apks/"

    echo "# Android Apk Files"

    find Apks/ -name "*.apk" | sort | while read apkfile ; do
        apkfile=$(echo $apkfile | cut -c 7-)
        apkname=$(echo $apkfile | rev | cut -c 5- | rev)
        echo ; echo "[$apkname]($url$apkfile)" ; done
}

fdroid_download() {
    cat "fdroid.plist" | while read APP_NAME_RAW ; do
        APP_NAME_PATH=$(echo $APP_NAME_RAW | sed 's/ //g')
        APP_NAME=$(echo "$APP_NAME_RAW" | tr ' ' '+')

        QUERY_FDROID=$(curl -sL "https://search.f-droid.org/?q=$APP_NAME")
        PARSE_QUERY=$(echo "$QUERY_FDROID" | grep package-header | grep -o 'href="[^"]*"' | sed 's/href="//;s/"$//' | head -n 1)
        APP_PAGE=$(curl -sL "$PARSE_QUERY")

        DOWN_URL=$(echo "$APP_PAGE" | tr " " "\n" | grep .apk | tail -n +2 | grep -o '".*"' | sed 's/"//g' | head -n 1)
        PNG_URL=$(echo "$APP_PAGE" | tr " " "\n" | grep .png | grep repo | grep content | grep -o '".*"' | sed 's/"//g' | head -n 1)

        [ -z "$DOWN_URL" ] && printf "\n\nERROR: $APP_NAME_PATH failed to query on F-Droid!\n\n"
        printf "\nDownloading $APP_NAME_PATH.apk"
        curl -sL $DOWN_URL -o "Apks/$APP_NAME_PATH-TEST.apk" && printf " ✓\n"; done
}

main