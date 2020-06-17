# Crypto2

O desafio apresenta a seguinte descrição:

```
Este é um método utilizado frequentemente para transmitir dados binários por meios de transmissão que lidam apenas com texto, como por exemplo para enviar arquivos anexos por e-mail.

Q1RGX0lubWV0cmljc19CYXNlNjQ=
```

### Writeup:

Ao efetuar uma busca pela dica "método utilizado frequentemente para transmitir dados binários", conseguimos uma orientação sobre decodificação Base64.

A decodificação pode ser feito através de recursos online pesquisando termos como "decode base64". Nesse writeup utilizamos o site [Base64](https://www.base64decode.org/).

Entramos com o seguinte informação para decodificação:
```
Q1RGX0lubWV0cmljc19CYXNlNjQ=
```
Após decodificado, obtemos a seguinte transcrição:
```
CTF_Inmetrics_Base64
```

Apartir desses dados obtemos a informação para compor a flag **Inm{CTF_Inmetrics_Base64}**.

---

[Voltar ao Menu Crypto](https://writeup.insidersec.io/crypto)
