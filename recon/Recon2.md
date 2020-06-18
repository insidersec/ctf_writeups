# Recon2

O desafio apresenta a seguinte descrição:

```
Quais portas TCP se encontram abertas no servidor www.inmetrics.com.br?
```

### Writeup:

Ao efetuar uma busca pela orientação "como verificar portas abertas", conseguimos a informação em um [vídeo tutorial](https://www.youtube.com/watch?v=qJnl0jW5UMg) sobre uma ferramenta chamada [Nmap](https://pt.wikipedia.org/wiki/Nmap).

A partir desse ponto, realizamos uma busca por uma ferramenta Nmap online. Nesse writeup utilizamos a ferramenta [Nmap Online](https://nmap.online/) para consultar as informações necessárias para responder o desafio.

```
Exemplo:
> Starting Nmap 7.80 ( https://nmap.org ) at 2020-06-18 06:43 PDT
> Nmap scan report for www.example.com.br (191.XXX.51.60)
> Host is up (0.22s latency).
> rDNS record for 191.XXX.51.60: site42.hostweb.com.br
> Not shown: 88 filtered ports
> PORT      STATE  SERVICE
> 21/tcp    XXXXX  ftp
> 80/tcp    XXXXX  http
> 113/tcp   XXXXX  ident
> 8000/tcp  XXXXX  http-alt
> 8008/tcp  XXXXX  http
> 8081/tcp  XXXXX  blackice-icecap
> 8443/tcp  XXXXX  https-alt
> 
> Nmap done: 1 IP address (1 host up) scanned in 7.15 seconds
```

Após efetuar a consulta Nmap para o site "inmetrics.com.br" na ferramenta, obtemos a informação necessária para compor a flag.

---

[Voltar ao Menu Recon](https://writeup.insidersec.io/recon)
