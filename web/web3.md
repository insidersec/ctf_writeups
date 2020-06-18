# Web3

## Writeup

![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web3.png)

![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web3-1.png)

Abrindo a opção de desenvolvedor (F12) e recarregando a página (CTRL+F5), podemos ver essa requisição estranha para um servidor inmsec.xyz buscando um script css.js

![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web3-2.png)

Olhando com mais cuidado percebemos que a requisição retorna um script e nesse script que rouba o seu cookie da página (e manda para nosso servidor  ) está a flag.
![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web3-3.png)

Outra solução possível seria executar console.log(flag)

![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web3-4.png)

---

[Voltar ao Menu Web](https://writeup.insidersec.io/web)