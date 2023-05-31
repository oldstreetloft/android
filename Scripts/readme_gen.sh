#!/bin/bash

main() {
    url="https://raw.githubusercontent.com/oldstreetloft/android/main/Apks/"

    echo "# Android Apk Files"
    find Apks/ -name "*.apk" | sort | while read apkfile; do
        apkfile=$(echo $apkfile | cut -c 7-)
        apkname=$(echo $apkfile | rev | cut -c 5- | rev)
        echo ; echo "[$apkname]($url$apkfile)" ; done
}

main | tee README.md