.PHONY: setup serve build clean new

setup:
	@hugo mod get -u

serve:
	@hugo server --buildDrafts --disableFastRender

build:
	@hugo --minify

clean:
	@rm -rf public resources/_gen

new:
	@hugo new content posts/nova-publicacao.md

