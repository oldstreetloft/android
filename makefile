.PHONY: default
.SILENT:

default:
	echo "Writing README.md"
	echo ; bash Scripts/readme_gen.sh ; echo
	git add --all
	git commit -m "Apk updated."
	git push