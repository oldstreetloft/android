.PHONY:		default
.SILENT:	default

default:	clean
			bash Scripts/readme_gen.sh
			git add --all
			git commit -m "Apk updated."
			git push

test:		clean
			bash Scripts/readme_gen_test.sh

clean:		clean
			rm -rf Apks/*-TEST.apk