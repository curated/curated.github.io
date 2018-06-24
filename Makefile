default: push

.PHONY: clean build copy push

clean:
	@rm -rf *.{css,html,ico,js}

build:
	@pushd ../web && \
	npm run clean && \
	npm run build && \
	popd

copy:
	@cp ../web/dist/* . && \
	rm -f *.map

push: clean build copy
	@git add . && \
	git commit -v -m "Update assets" && \
	git push origin master
