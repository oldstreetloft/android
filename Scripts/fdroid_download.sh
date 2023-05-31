#!/bin/bash

main() {
	APP_NAME_RAW="$1"
    APP_NAME=$(echo "$APP_NAME_RAW" | tr '[:upper:]' '[:lower:]' | tr ' ' '+')
    API_OUTPUT=$(curl -sL "https://search.f-droid.org/?q=$APP_NAME")
    API_URL=$(echo "$API_OUTPUT" | grep package-header | grep -o 'href="[^"]*"' | sed 's/href="//;s/"$//' | head -n 1)    
    APP_PAGE=$(curl -sL "$API_URL")
    DOWN_URL=$(echo $APP_PAGE | tr " " "\n" | grep .apk | tail -n +2 | grep -o '".*"' | sed 's/"//g' | head -n 1)
    PNG_URL=$(echo $APP_PAGE | tr " " "\n" | grep .png | grep repo | grep content | grep -o '".*"' | sed 's/"//g' | head -n 1)

    echo $API_URL
    echo $DOWN_URL
    echo $PNG_URL
}

main "$@"