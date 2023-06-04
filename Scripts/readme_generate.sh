#!/bin/bash

main() {
    # Define main public apk folder
    url="https://github.com/oldstreetloft/android/raw/main/Apks/"
    # Generate README.md for each .apk in apk folder
    printf "\nWriting README.md "
    write_readme > README.md
    printf " ✓\n\n"
}

write_readme() {
    # Write title
    printf "# Android Apks"
    # Itterate through each app in apk folder, write corresponding hyperlinks
    find Apks/ -name "*.apk" | sort | while read apkfile ; do
        apkfile=$(echo $apkfile | cut -c 7-)                # hyperlink filename
        apkname=$(echo $apkfile | rev | cut -c 5- | rev)    # hyperlink display name
        printf "\n\n*[$apkname]($url$apkfile)*" ; done      # Write hyperlink
}

# Start execution
main