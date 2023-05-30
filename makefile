.PHONY: add

add:
	bash Scripts/readme_gen.sh
	git add .
	git add Apks/*
	git commit -m "Added apk"
	git push