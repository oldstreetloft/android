.PHONY: default
.SILENT:

default:
	bash Scripts/readme_gen.sh
	git add --all
	git commit -m "Apk updated."
	git push