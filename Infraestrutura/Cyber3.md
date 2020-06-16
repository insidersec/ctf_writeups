# Cyber3

```
user: cyber3
pass: [flag cyber2]
```
### Writeup:

Ao listarmos o diretório encontramos uma pasta `Arquivos de Log`.
Dentro dela, um arquivo `log.zip`.
Com o comando `unzip` (descompactar arquivos) conseguimos extrair o arquivo zipado.
O problema é que não temos permissão de escrita no diretório que estamos, logo, teríamos que dezipar o arquivo em outro diretório.

O diretório `/tmp` (temporário) é o único lugar no sistema onde por padrão temos permissão de escrita.

Existem pelo menos dois métodos para fazer isso, o primeiro é uzar o comando `zcat` (usado para descompactar o arquivo e imprimir na tela).

O outro, é usar o comando “unzip -d” e redirecionar o arquivo para alguma pasta que voce criar no diretorio temporario.

>Em ambos os casos, apos descompactar o arquivo, encontramos uma string bem maior do que os desafios anteriores. Com um pouco de estudo sobre codificacao de dados, chegamos a conclusao de que a string esta em `base64`. Um bom site para ajudar nisso e o https://gchq.github.io/CyberChef/ onde voce pode testar diversos tipos de encoding.

Para fazer o decode da string, basta usar o comando “base64 -d“:
`cat log.zip | zcat | base64 -d`
ou
```
mkdir /tmp/log
unzip log.zip -d /tmp/log
cat /tmp/log/log.txt | base64 -d
```