.PHONY:		all
.SILENT:	all

all:		help default commit pull readme

help:
			bash Scripts/make_usage.sh

default:	pull readme commit

pull:
			bash Scripts/fdroid_download.sh

readme:
			bash Scripts/readme_generate.sh

commit:
			git add --all
			git commit -m "Update."
			git push
