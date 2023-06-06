.PHONY:		all
.SILENT:

default:
			bash Scripts/print_help.sh			# Print makefile usage

list:
			bash Scripts/fdroid_list.sh			# List apps in Apks/ and fdroid.plist

add:
			bash Scripts/fdroid_add.sh			# Add app to fdroid.plist and download Apks/
			make update

remove:
			bash Scripts/fdroid_remove.sh		# Remove app from fdroid.plist and Apks/
			make commit

update:
			bash Scripts/fdroid_download.sh		# Download fdroid.plist to Apks/
			make commit

commit:
			bash Scripts/readme_generate.sh		# Generate README.md
			git add --all						# Commit repo changes
			git commit -m "App updated."
			git push ; echo
