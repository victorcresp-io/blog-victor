.PHONY: setup serve preview build deploy clean new editor

setup:
	@hugo mod get -u

serve:
	@hugo server --disableFastRender

preview:
	@hugo server --buildDrafts --disableFastRender

build:
	@hugo --minify

deploy: build
	@install -d -m 0755 /var/www/caderno-aberto
	@rsync -a --delete public/ /var/www/caderno-aberto/
	@echo "Site publicado em https://dataengineervictor.com"

clean:
	@rm -rf public resources/_gen

new:
	@hugo new content posts/nova-publicacao.md

editor:
	@test -f "$$HOME/.config/frankmd/fed.sh" || { echo "FrankMD não encontrado. Consulte a seção FrankMD no README."; exit 1; }
	@bash -c 'source "$$HOME/.config/frankmd/fed.sh" && fed content/posts'
