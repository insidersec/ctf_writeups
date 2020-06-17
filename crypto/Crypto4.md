# Crypto4

O desafio apresenta a seguinte descrição:

```
Essa hash de senha foi vazada na internet e é uma senha bem comum, você conseguiria quebrá-la?

21bd12dc183f740ee76f27b78eb39c8ad972a757
```

### Writeup:

Conforme orientado na descrição do desafio, essa é uma hash de senha.

Para sua decodificação pesquisamos por recursos online utilizando os termos como "hash decode". Nesse writeup utilizamos o site [MD5 Hashing](https://md5hashing.net/hash).

Através dessa ferraemnta podemos identificar e decodificar a hash, para isso selecionamos a opção "Search by all hash types" no quadro "Hash reverse lookup, unhash, decrypt, search"

Entramos com o seguinte informação para decodificação:
```
21bd12dc183f740ee76f27b78eb39c8ad972a757
```
Após o processamento, obtemos a seguinte transcrição:
```
Sha1 digest unhashed, decoded, decrypted, reversed value:
P@ssw0rd
```

A partir desses dados obtemos a informação para compor a flag **Inm{P@ssw0rd}**.

---

[Voltar ao Menu Crypto](https://writeup.insidersec.io/crypto)
