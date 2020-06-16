# Cyber0

user: cyber0
pass: cyber0
Writeup:
Neste cenario, o usuario e senha "cyber0" servem para iniciar o desafio.
Com o comando "ssh" (programa de login remoto) podemos nos conectar a maquina do desafio.
Usamos o comando: ssh ctf.insidersec.io -p 9090 -l cyber0
Onde "-p" indica a porta e "-l" o usuario.
Apos inserir a senha, entramos na maquina do desafio.
Com o comando "ls" (listar diretorio) vemos o arquivo "flag.txt".
Com o comando "cat" (exibir conteudo do arquivo na tela) temos a senha do cyber1.