#!/bin/bash
main() {
    readme_gen | tee README.md
}

main() {
    url="https://github.com/oldstreetloft/android/raw/main/Apks/"

    echo "# Android Apk Files"
    find Apks/ -name "*.apk" | sort | while read apkfile; do
        apkfile=$(echo $apkfile | cut -c 7-)
        apkname=$(echo $apkfile | rev | cut -c 5- | rev)
        echo ; echo "[$apkname]($url$apkfile)" ; done
}

main