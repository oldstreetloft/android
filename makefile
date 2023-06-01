.PHONY:		default commit
.SILENT:

default:
			bash Scripts/fdroid_download.sh
			bash Scripts/readme_generate.sh
			git add --all
			git commit -m "Apks updated."
			git push

commit:
			git add --all
			git commit -m "Misc fixes."
			git push