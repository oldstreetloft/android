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
    find Apks/ -name "*.apk" | sort | while read apkfile ; do
        apkfile=$(echo $apkfile | cut -c 7-)                # hyperlink filename
        apkname=$(echo $apkfile | rev | cut -c 5- | rev)    # hyperlink display name
        write_hyperlink 
        write_ps_link ; done
}

write_hyperlink() {
    printf "\n\n*[$apkname]($url$apkfile)*\n"              # Write hyperlink
}

write_ps_link() {	# Query Google Playstore for the app extract app link from query
    QUERY=$(curl -s "https://play.google.com/store/search?q=$apkname&c=apps")
	REGEX='href="/store/apps/details?id=[^"]*"'
    APP_LINK=$(echo "$QUERY" | grep -o "$REGEX" | head -n 1 | cut -c7- | sed 's/.$//')
    printf "https://play.google.com$APP_LINK" ; echo

}

# Start execution
main