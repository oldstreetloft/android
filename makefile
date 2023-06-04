.PHONY:		all
.SILENT:

default:
			make fdroid
			make readme
			make commit

fdroid:
			bash Scripts/fdroid_download.sh		# fdroid.plist

readme:
			bash Scripts/readme_generate.sh		# README.md

commit:
			git add --all						# Commit repo changes
			git commit -m "Update."
			git push ; echo