.PHONY:		all
.SILENT:

default:
			clear
			bash Scripts/print_help.sh			# Print makefile usage

add:
			clear
			bash Scripts/fdroid_add.sh			# Add new app to fdroid.plist and download Apks/
			make update

remove:
			clear
			bash Scripts/fdroid_remove.sh		# Remove app from fdroid.plist and Apks/
			make commit

list:
			clear
			bash Scripts/fdroid_list.sh			# List all apps tracked in fdroid.plist

update:
			clear
			bash Scripts/fdroid_download.sh		# Download all apps in fdroid.plist to Apks/
			make commit

commit:
			bash Scripts/readme_generate.sh		# Generate new README.md from Apks/
			git add --all						# Commit all repo changes
			git commit -m "App updated."
			git push ; echo
