Clicando no desafio **Web10**, não encontramos o link do desafio, porém temos a dica ***"Vish, essa nem a Google acha."***
![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web10.png)

~~Então vamos analisar o código fonte.~~
- Com alguns conceitos de Segurança, nós começamos a pesquisar um pouco sobre Crawlers.
- Na pesquisa, descobrimos que o Google faz um tipo de "scan" de milhares de sites para melhorar o seu index.
- Porém, nem tudo é indexado pelo Google, por isso a dica *"Vish, essa nem a Google acha."*
1. Então digitando na URL Robots.txt encontramos uma nova página.
2. Nesta nova página, temos uma imagem dizendo "Whyyyyyyyyyyyyy??????".
3. Agora sim, vamos analisar o código da página.
4. Percebemos que tem uma função escondida quando tentamos clicar ou copiar o "Whyyyyyyyyyyyyy??????"
![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web10-1.png)
5. E quando clicamos, aparece um alerta com um texto (Judgment_Day).
