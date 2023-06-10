#!/bin/bash

main() {
    URL="https://github.com/oldstreetloft/android/raw/main/Apks/"   # Define public location of Apks/
    printf "\nWriting README.md "
    write_readme > README.md                                        # Generate README.md from contents of Apks/
    printf " ✓\n\n"
}

write_readme() {
    # Write title
    printf "# Android Apks"
    # Itterate through each app in apk folder, write corresponding hyperlinks
    find Apks/ -name "*.apk" | sort | while read APK_FILE ; do
        APK_FILE=$(echo $APK_FILE | cut -c 7-)                      # hyperlink filename
        APK_NAME=$(echo $APK_FILE | rev | cut -c 5- | rev)          # hyperlink display name
        printf "\n\n*[$APK_NAME]($URL$APK_FILE)*" ; done            # Write hyperlink
}

# Start execution
main