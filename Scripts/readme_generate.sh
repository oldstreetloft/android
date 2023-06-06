#!/bin/bash

main() {
    # Define location of public apk folder
    URL="https://github.com/oldstreetloft/android/raw/main/Apks/"
    # Generate README.md for each .apk in apk folder
    printf "\nWriting README.md "
    write_readme > README.md
    printf " ✓\n\n"
}

write_readme() {
    # Write title
    printf "# Android Apks"
    # Itterate through each app in apk folder, write corresponding hyperlinks
    find Apks/ -name "*.apk" | sort | while read APK_FILE ; do
        APK_FILE=$(echo $APK_FILE | cut -c 7-)                # hyperlink filename
        APK_NAME=$(echo $APK_FILE | rev | cut -c 5- | rev)    # hyperlink display name
        printf "\n\n*[$APK_NAME]($URL$APK_FILE)*" ; done      # Write hyperlink
}

# Start execution
clear
main