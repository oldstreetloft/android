#!/bin/bash

main() {
    echo "# Android Apk Files"
    url="https://github.com/oldstreetloft/android/raw/main/Apks/"
    find Apks/ -name "*.apk" | sort | while read apkfile; do
        apkfile=$(echo $apkfile | cut -c 9-)
        apkname=$(echo $apkfile | rev | cut -c 5- | rev)
        echo ; echo "[$apkname]($url$apkfile)" ; done
}

main | tee ../README.md