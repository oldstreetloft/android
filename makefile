.PHONY: default
.SILENT:

default:
	echo
	bash Scripts/readme_gen.sh
	echo
	git add --all
	git commit -m "Apk updated."
	git push