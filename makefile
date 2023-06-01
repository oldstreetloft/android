.PHONY:		default
.SILENT:	default

default:
			bash Scripts/fdroid_download.sh
			bash Scripts/readme_generate.sh
			git add --all
			git commit -m "Apk updated."
			git push