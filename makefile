.PHONY:		all
.SILENT:

default:	fdroid_dl
			make commit

help:
			bash Scripts/print_help.sh			# Print makefile usage

add:
			bash Scripts/fdroid_add.sh			# Add new app to fdroid.plist download /Apks and generate README.md
			make fdroid_dl
			make commit

rm:
			bash Scripts/fdroid_remove.sh		# Remove app from Apks/ fdroid.plist and README.md
			make commit

fdroid_dl:
			bash Scripts/fdroid_download.sh		# Download all fdroid.plist to Apks/

commit:
			bash Scripts/readme_generate.sh		# Generate new README.md from Apks/
			git add --all						# Commit all repo changes
			git commit -m "Update."
			git push ; echo
