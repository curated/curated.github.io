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
	git commit -vm "Deploy $(shell git --git-dir=../web/.git rev-list --max-count=1 HEAD)" && \
	git push origin master
