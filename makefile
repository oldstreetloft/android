.PHONY:		all
.SILENT:

default:	pull readme commit

pull:
			bash Scripts/fdroid_download.sh

readme:
			bash Scripts/readme_generate.sh

commit:
			git add --all
			git commit -m "Update."
			git push

help:
			bash Scripts/make_usage.sh