#!/bin/bash

read -p "Enter app name to remove: " APK_NAME
rm -rf Apks/$APK_NAME.apk
rm -rf Images/$APK_NAME.png
cat fdroid.plist