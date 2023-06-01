.PHONY:		all
.SILENT:

default:	pull readme commit

all:		default commit pull readme h help

pull:
			bash Scripts/fdroid_download.sh

readme:
			bash Scripts/readme_generate.sh

commit:
			git add --all
			git commit -m "Update."
			git push

h:			help

help:
			bash Scripts/make_usage.sh