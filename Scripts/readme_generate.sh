#!/bin/bash

main() {
    # Generate README.md from .apk in apk folder
    printf "\nWriting README.md:\n\n"
    write_readme | tee README.md ; echo
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