.PHONY: default
.SILENT:

default:
	echo "Writing README.md"
	bash Scripts/readme_gen.sh 1> /dev/null
	git add --all
	git commit -m "Apk updated."
	git push