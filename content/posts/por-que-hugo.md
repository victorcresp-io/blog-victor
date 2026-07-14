---
title: "Por que escolhi Hugo para este blog"
date: 2026-07-10T10:30:00-03:00
description: "Velocidade, simplicidade e conteúdo que continua sendo seu."
tags: ["hugo", "web", "markdown"]
categories: ["Tecnologia"]
draft: false
toc: true
---

Criar um blog não deveria exigir um banco de dados, uma longa lista de plugins e atualizações semanais. Para este projeto, eu queria algo simples de entender e fácil de manter.

## Conteúdo em primeiro lugar

No Hugo, cada post é um arquivo Markdown. O texto fica legível mesmo fora do site e pode ser versionado com Git.

```text
content/
└── posts/
    └── meu-primeiro-post.md
```

## Páginas rápidas

O Hugo gera HTML pronto para ser servido. Não há processamento no servidor a cada visita, o que torna o site rápido e barato de hospedar.

## Um fluxo de publicação simples

O processo cabe em três passos:

1. Criar um arquivo com `hugo new posts/meu-post.md`;
2. Escrever e revisar localmente;
3. Gerar o site com `hugo --minify` e publicar.

É uma base pequena, mas que pode crescer junto com o conteúdo.

