# Web10

## Writeup

Clicando no desafio **Web10**, não encontramos o link do desafio, porém temos a dica ***"Vish, essa nem a Google acha."***
![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web10.png)

~~Então vamos analisar o código fonte.~~

>Calma, ainda não.
>Primeiro precisamos entender algumas coisas.

>Não, a flag não é ~~Thayná Bitencourt~~ 😒

- Vamos entender melhor o desafio, nós começamos a pesquisar um pouco sobre [como a google acha as coisas](https://www.google.com/search/howsearchworks/crawling-indexing/). 
- Na pesquisa, descobrimos que o Google rasteja (`Crawl`) por toda a internet para construir seu `Index`.
- Porém, nem tudo é indexado pelo Google, por isso a dica *"Vish, essa nem a Google acha."*
1. Então digitando na URL `robots.txt` encontramos uma nova página.
2. Nesta nova página, temos uma imagem dizendo "Whyyyyyyyyyyyyy??????".
3. Agora sim, vamos analisar o código da página.
4. Percebemos que tem uma função escondida quando tentamos clicar ou copiar o "Whyyyyyyyyyyyyy??????"
![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web10-1.png)
5. E quando clicamos, aparece um alerta com a flag.

---

[Voltar ao Menu Web](https://writeup.insidersec.io/web)