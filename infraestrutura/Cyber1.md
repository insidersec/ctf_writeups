# Cyber1

```
user: cyber1
pass: [flag cyber0]
```
### Writeup:

Com a senha obtida com o usuario cyber0, podemos logar no cyber1.
Listando `ls` os arquivos do diretorio encontramos um arquivo nomeado como `-` (traço).
Ao tentarmos usar o comando `cat` para ver seu conteudo nao obtemos resultado.
>Isso acontece porque o `cat` tenta interpretar o nome do diretorio como um comando linux.
>Quando temos um arquivo iniciado por caractere especial devemos especificar seu caminho completo.

Usando o comando `pwd` (exibe o caminho do diretorio atual) podemos ver o nome do diretorio que estamos.
No caso, `/home/cyber1`

Logo, podemos usar o comando:
```
cat /home/cyber1/-
```
ou
```
cat ./-
```

---

[Voltar ao Menu Infraestrutura](https://writeup.insidersec.io/infraestrutura)