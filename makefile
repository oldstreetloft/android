.PHONY:		all
.SILENT:

default:
			make fdroid_download
			make readme_generate
			make commit

help:
			bash Scripts/print_help.sh			# Print makefile usage

fdroid_add:
			bash Scripts/fdroid_add.sh			# Add new app to fdroid.plist download /Apks and generate README.md
			make fdroid_download
			make readme_generate

fdroid_remove:
			bash Scripts/fdroid_remove.sh		# Remove app from Apks/ fdroid.plist and README.md
			make readme_generate

fdroid_download:
			bash Scripts/fdroid_download.sh		# Download all fdroid.plist to Apks/

readme_generate:
			bash Scripts/readme_generate.sh		# Generate new README.md from Apks/

commit:
			git add --all						# Commit all repo changes
			git commit -m "Update."
			git push ; echo
