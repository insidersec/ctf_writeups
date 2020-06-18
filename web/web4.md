# Web5

## Writeup

Abrimos o modo desenvoder do browser (F12)


![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web4-1.png)


Recarregamos a página (CTRL+F5) e algumas requisições retornam 404 (NOT FOUND)


![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web4-2.png)


Investigando as requisições podemos ver um erro de digitação de PNG para PMG


![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web4-3.png)


Abrindo numa nova aba


![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web4-4.png)


![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web4-5.png)


Corrigindo para `https://desafio.insidersec.io/files/e9ef9f46d5b4be4d210b3b60c1707221/chicago.png`


![alt text](https://raw.githubusercontent.com/insidersec/ctf_writeups/master/img/web4-6.png)

---

[Voltar ao Menu Web](https://writeup.insidersec.io/web)