# Cyber0

```
user: cyber0
pass: cyber0
```
### Writeup:

Com o comando `ssh` podemos nos conectar a maquina do desafio.
Acessamos a máquina com: 
```
ssh ctf.insidersec.io -p 9090 -l cyber0
```
Onde `-p` indica a porta e `-l` o usuario.
Apos inserir a senha, entramos na maquina do desafio.
Com o comando `ls` (listar diretorio), o arquivo `flag.txt` é listado.
Com o comando `cat` exibimos o conteúdo do arquivo
```
cat flag.txt
```
e obtemos a flag.

---

[Voltar ao Menu Infraestrutura](https://github.com/insidersec/ctf_writeups/blob/master/Infraestrutura/infraestrutura.md)