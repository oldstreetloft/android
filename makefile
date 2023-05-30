.PHONY: add

add:
	bash Scripts/readme_gen.sh
	git add --all
	git commit -m "Added apk"
	git push