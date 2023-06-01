.PHONY:		all
.SILENT:

default:	help

update:		pull readme commit

pull:
			bash Scripts/fdroid_download.sh

readme:
			bash Scripts/readme_generate.sh

commit:
			echo ; echo "Commiting changes to repo:" ; echo
			git add --all
			git commit -m "Update."
			git push ; echo

add:
			bash Scripts/apk_add.sh

remove:
			bash Scripts/apk_remove.sh

help:
			bash Scripts/make_usage.sh