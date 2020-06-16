# Cyber6

```
user: cyber6
pass: [flag cyber5]
```
### Writeup:


Ao listarmos o diretorio encontramos o arquivo `bruteforce-me` e um arquivo oculto `.rockyou.txt`.

Ao executarmos o comando `file` no arquivo `bruteforce-me`, notamos que se trata de um `zip`. 

Se tentarmos dar o comando `unzip`, vemos que o arquivo pede senha, dai entao, o nome `bruteforce-me`  

>Brute force é a nomenclatura usada para ataques de força bruta, ou seja, quebrar uma senha, por exemplo, através de diversas tentativas. 

Ao pesquisarmos como podemos fazer um bruteforce em um arquivo ZIP, de cara, econtramos a ferramenta `fcrackzip`. 

Intuitivamente, temos um arquivo oculto que possui diversas palavras. Esse arquivo é chamado de `Wordlist` ou `Dicionário` e usamos para efetuar um ataque de dicionário, que é uma modelidade de força bruta:

`fcrackzip -D -p .rockyou.txt -u bruteforce-me`