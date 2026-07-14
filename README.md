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
hugo server
```

## Criar uma publicação

### Com FrankMD

O projeto contém uma integração com o [FrankMD](https://github.com/akitaonrails/FrankMD), que edita diretamente os arquivos em `content/posts/`.

O instalador oficial requer Docker. Instale o FrankMD uma única vez:

```bash
curl -sL https://raw.githubusercontent.com/akitaonrails/FrankMD/master/install.sh | bash
```

Adicione o comando `fed` à sessão atual:

```bash
source ~/.config/frankmd/fed.sh
```

O FrankMD instala `fed` como uma função do shell, não como um executável em `/usr/bin`. Por isso, `command -v fed` somente encontra o comando depois do `source` acima. O comando `make editor` deste projeto já carrega o arquivo automaticamente.

Para tornar o comando permanente no Bash:

```bash
echo 'source ~/.config/frankmd/fed.sh' >> ~/.bashrc
source ~/.bashrc
```

Na raiz do projeto, abra o editor:

```bash
make editor
```

Ou execute diretamente:

```bash
fed content/posts
```

No FrankMD, use `Ctrl+N` e selecione **Hugo Blog Post**. Os novos textos serão criados como `content/posts/titulo-do-post.md`, inicialmente com `draft: true`. Para revisar rascunhos, use `make preview`. Para publicar, altere para `draft: false` e confirme com `make serve`.

Os dois modos locais são:

```bash
make serve    # somente publicações com draft: false
make preview  # inclui publicações com draft: true
```

Ao enviar uma imagem, mantenha o cursor abaixo do segundo `---` do front matter antes de clicar em inserir. O FrankMD salvará o arquivo em `content/posts/images/`; o render hook do projeto converte esse caminho automaticamente para a URL publicada pelo Hugo.

A integração é formada por:

- `content/posts/.fed`: interface em português e posts no formato plano;
- `content/posts/.hugo_template.md`: front matter usado em novas publicações;
- `layouts/shortcodes/youtube.html`: suporte aos vídeos inseridos pelo FrankMD com a opção de shortcode Hugo.
- `layouts/_default/_markup/render-image.html`: corrige os caminhos das imagens enviadas pelo editor.

Os arquivos `.fed` e `.hugo_template.md` devem ser versionados: eles não contêm segredos e garantem a mesma configuração para quem clonar o blog. Não coloque chaves de API nesses arquivos; use o arquivo de ambiente global do FrankMD para credenciais.

### Com Hugo no terminal

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
