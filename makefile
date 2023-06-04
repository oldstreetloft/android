.PHONY:		all
.SILENT:

default:	update

help:
			bash Scripts/print_help.sh			# Print makefile usage

add:
			bash Scripts/fdroid_add.sh			# Add new app to fdroid.plist and download /Apks
			make update

remove:
			bash Scripts/fdroid_remove.sh		# Remove app from Apks/ fdroid.plist and README.md
			make commit

list:
			bash Scripts/fdroid_list.sh

update:
			bash Scripts/fdroid_download.sh		# Download all fdroid.plist to Apks/
			make commit

commit:
			bash Scripts/readme_generate.sh		# Generate new README.md from Apks/
			git add --all						# Commit all repo changes
			git commit -m "App updated."
			git push ; echo
