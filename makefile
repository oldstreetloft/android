.PHONY:		all
.SILENT:

default:	pull readme commit

pull:
			bash Scripts/fdroid_download.sh

readme:
			bash Scripts/readme_generate.sh

commit:
			echo ; echo "Commiting changes to repo:" ; echo
			git add --all
			git commit -m "Update."
			git push && echo || echo

help:
			bash Scripts/make_usage.sh