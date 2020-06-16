# Cyber4

```
user: cyber4
pass: [flag cyber3]
```
### Writeup:

Ao logarmos na máquina, encontramos um arquivo `try-me`, dando o comando `file` nele, descobrimos que é um binário, ou seja, um arquivo executável. 
```
$ file try-me
try-me: ELF 64-bit LSB executable, x86-64, version 1 (GNU/Linux), statically linked, BuildID[sha1]=4cd78b5ac2bea87c2220e037a62f3bdfb3b11789, for GNU/Linux 3.2.0, stripped
```
Ao tentarmos executá-lo: `./try-me` ou `sh try-me` não temos retorno.
Como todo arquivo executável, que segue o padrão `UNIX` podemos passar o parâmetro `--help`.
`./try-me --help` retorna `Por favor passe um numero inteiro válido`
Ao passarmos o número `1` como parâmetro `./try-me 1`, obtemos a resposta `Achou que ia ser tão fácil?` 
Ao passarmos o número `2` como parâmetro `./try-me 2`, obtemos a resposta `Maior`
Ao passarmos o número `100` como parâmetro `./try-me 100`, obtemos a resposta `Menor`
Notamos então que o valor está entre `2` e `100`.
Podemos usar o loop `for` para testar as possibilidades:
`for i in {3..100}; do ./try-me $i; done`
Traduzindo o loop: enquanto `i` for menor ou igual a 100, inciando com `i=3` e somando `1` ao final de cada iteração, execute `./try-me $i` onde `$i` é o valor da variável no instante atual do loop.

Ao executarmos o comando notamos que ele nos traz todos os outputs, dificultando a vizualização da nossa resposta…
Podemos assim, usar o comando `grep` para filtrar as respostas.

`for i in {1..100}; do ./try-me $i; done |grep -Ev "Maior|Menor"`

Em alguns instantes, temos a nossa flag.
