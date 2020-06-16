# Cyber2

```
user: cyber2
pass: [flag cyber1]
```
### Writeup:

Neste desafio, ao tentarmos dar o comando "ls" verificamos que nao temos nenhum arquivo na pasta.
Se verificarmos o "man" do "ls" podemos notar que temos a opcao "-a" que e usado para listar todos os arquivos (inclusive arquivos ocultos).
Utilizando `ls -a` ou `ls -la` podemos ver alguns arquivos do sistema como ".bash_logout", ".bash", ".profile", etc...
Note que todos os arquivos se iniciam com `.`
>Isso porque no Linux, para indicar que um arquivo deve ser oculto ao usuario usamos o ponto antes do nome.
>Para conseguirmos visualizar o arquivo, devemos usar o comando "cat ." e o nome do arquivo.
>No linux também temos a notação `.` (ponto) que indica o diretório onde estamos e `..` (2 pontos) que indica o repositório >anterior, por exemplo `ls .` seria equivalente a `ls /home/cyber2` e `ls ..` seria equivalente a `ls /home`  

No caso, o arquivo se chama `…` (três pontos)
portanto `cat ...`