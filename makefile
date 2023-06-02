.PHONY:		all
.SILENT:

default:
			bash Scripts/fdroid_download.sh		# fdroid.plist
			bash Scripts/readme_generate.sh		# README.md
			git add --all						# Commit repo changes
			git commit -m "Update."
			git push ; echo