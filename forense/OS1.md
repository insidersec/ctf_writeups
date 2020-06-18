# OS1

O desafio apresenta a seguinte descrição:

```
Ora Ora! Parece que temos um Xeroque Rolmes aqui!

> lsass.dmp (Arquivo para download)
```

### Writeup:

Para iniciar a resolução desse writeup, efetuamos uma busca para descobrir o que é um arquivo do tipo ".dmp".

> "Um arquivo DMP é um arquivo que contém dados "despejados" do espaço de memória de um programa. Muitas vezes, é criado quando um programa tem um erro ou falha e também pode ser salvo pelo programa "Savedump.exe" na primeira reinicialização após uma falha. Arquivos DMP são geralmente chamados de "Memory. dmp"." // Fonte: [FileMemo](https://filememo.info/extension/dmp)

Ao efetuar uma pesquisa sobre como ler os dados contidos nesse tipo de arquivo, encontramos bastante conteúdo referenciando técnicas e maneiras para gerar e ler as informações de um arquivo dump. Nesse writeup utilizamos a ferramenta [Pypykatz](https://github.com/skelsec/pypykatz) seguindo orientações dispostas no site [Hackndo](https://en.hackndo.com/remote-lsass-dump-passwords/#linux--windows).

Após a instalar a ferramenta conforme orientações do git Pypykatz, executamos via terminal o seguinte comando para efetuar a leitura do conteúdo do arquivo dump:

```
pypykatz.exe lsa minidump lsass.dmp
```

A execução desse comando gerará uma saída conforme o exemplo:

```
Exemplo:
> INFO:root:Parsing file lsass.dmp
> FILE: ======== lsass.dmp =======
> == LogonSession ==
> authentication_id 70987 (1154b)
> session_id 0
> username Usuario
> domainname USER-CD8F6E62
> logon_server USER-CD8F6E62
> logon_time 2020-05-15T21:17:43.528335+00:00
> sid S-1-5-21-1214440339-1078081533-682003330-1007
> luid 70987
>         == MSV ==
>                 Username: Usuario
>                 Domain: USER-CD8F6E62
>                 LM: NA
>                 NT: 880d0c08cb1d7600c971b3f8bcc08fbb
>                 SHA1: 5aeb80e91a10afc87fb8c15a23ef8b81e6a0cb14
>         == WDIGEST [1154b]==
>                 username Usuario
>                 domainname USER-CD8F6E62
>                 password Senha_do_usuario
>         == Kerberos ==
>                 Username: Usuario
>                 Domain: USER-CD8F6E62
>                 Password: Senha_do_usuario
>         == WDIGEST [1154b]==
>                 username Usuario
>                 domainname USER-CD8F6E62
>                 password Senha_do_usuario
```

Analisando o retorno desse processamento, obtemos a informação necessária no campo "password" para compor a flag do desafio.

```
Outras Referências:
> https://medium.com/@viniciuskmax/obtendo-senhas-e-hashes-do-windows-via-mem%C3%B3ria-e-registro-o-guia-atualizado-b4e67edd4823
> https://www.hackingarticles.in/credential-dumping-local-security-authority-lsalsass-exe/
```

---

[Voltar ao Menu Forense](https://writeup.insidersec.io/forense)
