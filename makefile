.PHONY:		all
.SILENT:

all:		default commit pull readme

default:	pull readme commit

pull:
			bash Scripts/fdroid_download.sh

readme:
			bash Scripts/readme_generate.sh

commit:
			git add --all
			git commit -m "Misc fixes."
			git push
