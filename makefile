.PHONY:		all
.SILENT:

default:
			make fdroid_download
			make readme_generate
			make commit

help:
			bash Scripts/print_help.sh			# Print makefile usage

fdroid_add:
			bash Scripts/fdroid_add.sh			# Add app to fdroid.plist
			make fdroid_download
			make readme_generate

fdroid_remove:
			bash Scripts/fdroid_remove.sh		# Remove apk and app from fdroid.plist
			make readme_generate

fdroid_download:
			bash Scripts/fdroid_download.sh		# fdroid.plist

readme_generate:
			bash Scripts/readme_generate.sh		# README.md

commit:
			git add --all						# Commit repo changes
			git commit -m "Update."
			git push ; echo
