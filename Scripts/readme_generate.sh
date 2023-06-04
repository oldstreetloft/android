#!/bin/bash

main() {
    # Define main public apk folder
    url="https://github.com/oldstreetloft/android/raw/main/Apks/"
    # Generate README.md for each .apk in apk folder
    printf "\nWriting README.md "
    write_readme > README.md
    printf " ✓\n\n"
}

write_readme(){
    # Write title
    echo "# Android Apks"
    # Itterate through each apk in apk folder and write corresponding hyperlinks
    find Apks/ -name "*.apk" | sort | while read apkfile ; do write_hyperlink ; done
}

write_hyperlink() {
    apkfile=$(echo $apkfile | cut -c 7-)                # hyperlink filename
    apkname=$(echo $apkfile | rev | cut -c 5- | rev)    # hyperlink display name
    echo ; echo "*[$apkname]($url$apkfile)*"            # Write hyperlink
}

# Start execution
main