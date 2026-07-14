.PHONY: setup serve preview build clean new editor

setup:
	@hugo mod get -u

serve:
	@hugo server --disableFastRender

preview:
	@hugo server --buildDrafts --disableFastRender

build:
	@hugo --minify

clean:
	@rm -rf public resources/_gen

new:
	@hugo new content posts/nova-publicacao.md

editor:
	@test -f "$$HOME/.config/frankmd/fed.sh" || { echo "FrankMD não encontrado. Consulte a seção FrankMD no README."; exit 1; }
	@bash -c 'source "$$HOME/.config/frankmd/fed.sh" && fed content/posts'
