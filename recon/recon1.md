# Recon1

## Resolução 1 [@notfounnd](https://github.com/notfounnd)
O desafio apresenta a seguinte descrição:

```
Quando o domínio 'inmetrics.com.br' expira?
```

### Writeup:

Ao efetuar uma busca pela orientação "verificar informações de dominio", conseguimos a informação que os dados de um domínio podem ser verificados através do protocolo [WHOIS](https://pt.wikipedia.org/wiki/WHOIS).

```
Exemplo:
> Domain ID:D51687756-LROR
> Domain Name:WIKIPEDIA.ORG
> Created On:13-Jan-2001 00:12:14 UTC
> Last Updated On:01-Mar-2006 12:39:33 UTC
> Expiration Date:13-Jan-2015 00:12:14 UTC
> Sponsoring Registrar:Go Daddy Software, Inc. (R91-LROR)
> Status:CLIENT DELETE PROHIBITED
> Status:CLIENT RENEW PROHIBITED
> Status:CLIENT TRANSFER PROHIBITED
> Status:CLIENT UPDATE PROHIBITED
> Registrant ID:GODA-09495921
> Registrant Name:Bradford Patrick
> Registrant Organization:Wikimedia Foundation, Inc.
```

Com essa informação, buscamos uma ferramenta online que verifica o protocolo WHOIS. Nesse writeup utilizamos a ferramenta [WHOis.net](https://whois.net/) para consultar os dados correspondentes à data de expiração do domínio.

```
Exemplo:
> expires: AAAAMMDD
```
## Resolução 2 [@allvesz](https://github.com/allvesz)

Após consultar os dados do site "inmetrics.com.br" na ferramenta, obtemos a informação necessária para compor a flag.

Logo quando acessamos o desafio, vemos a pergunta: 

![alt text](https://raw.githubusercontent.com/allvesz/ctf_writeups/master/img/Recon1.png)

Baseado na pergunta, temos dois modos de resolver.
1. Utilizando o Shell, com o comando "whois inmetrics.com.br".

![alt text](https://raw.githubusercontent.com/allvesz/ctf_writeups/master/img/Recon1-1.png)

2. Utilizando o browser para acessar algum site com **whois**, como o https://registro.br/tecnologia/ferramentas/whois/.

3. No site do RegistroBR, digite o domínio "inmetrics.com.br"

![alt text](https://raw.githubusercontent.com/allvesz/ctf_writeups/master/img/Recon1-2.png)

---

[Voltar ao Menu Recon](https://writeup.insidersec.io/recon)

