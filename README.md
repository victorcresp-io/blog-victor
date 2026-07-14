# Caderno Aberto — POC Hugo

POC de um blog pessoal em português usando o tema [Hugo Blog Awesome](https://github.com/hugo-sid/hugo-blog-awesome).

## Pré-requisitos

- Hugo Extended 0.120 ou mais recente
- Go 1.22 ou mais recente (para baixar o tema como módulo)

## Rodar localmente

```bash
make setup
make serve
```

Abra <http://localhost:1313>.

Também é possível executar diretamente:

```bash
hugo mod get -u
hugo server --buildDrafts
```

## Criar uma publicação

```bash
hugo new content posts/minha-publicacao.md
```

Edite o arquivo criado em `content/posts/`, altere `draft` para `false` e rode o servidor para revisar.

## Gerar para produção

Atualize `baseURL` em `hugo.toml` com o domínio real e execute:

```bash
hugo --minify
```

O site final será criado em `public/` e pode ser publicado no GitHub Pages, Cloudflare Pages, Netlify ou qualquer hospedagem de arquivos estáticos.

## Pontos para personalizar

- Nome, biografia e descrição: `hugo.toml`
- Links sociais: `hugo.toml`, seção `params.socialIcons`
- Página institucional: `content/about.md`
- Posts: `content/posts/`
- URL do site: propriedade `baseURL` em `hugo.toml`

