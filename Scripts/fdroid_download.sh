#!/bin/bash

main() {
    APP_NAME_RAW="$1"
    DOWN_PATH="$2"

    [ -z "$1" ] && read -p 'Enter app name: ' APP_NAME_RAW
    APP_NAME=$(echo "$APP_NAME_RAW" | tr ' ' '+')
    QUERY_FDROID=$(curl -sL "https://search.f-droid.org/?q=$APP_NAME")
    PARSE_QUERY=$(echo "$QUERY_FDROID" | grep package-header | grep -o 'href="[^"]*"' | sed 's/href="//;s/"$//' | head -n 1)    
    APP_PAGE=$(curl -sL "$PARSE_QUERY")
    DOWN_URL=$(echo $APP_PAGE | tr " " "\n" | grep .apk | tail -n +2 | grep -o '".*"' | sed 's/"//g' | head -n 1)
    PNG_URL=$(echo $APP_PAGE | tr " " "\n" | grep .png | grep repo | grep content | grep -o '".*"' | sed 's/"//g' | head -n 1)

    echo "App page: $PARSE_QUERY"
    echo "Apk URL: $DOWN_URL"
    echo "App Icon: $PNG_URL"
    echo

    curl -sL $DOWN_URL -o $APP_NAME_RAW.apk
}

main "$@"