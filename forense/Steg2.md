# Steg2

O desafio apresenta a seguinte descrição:

```
Nem tudo é o que parece.

> logoi.jpg (Arquivo para download)
```

### Writeup:

Para iniciar a resolução desse writeup, precisamos entender à que se refere o termo "Steg". Através da busca "o que é steg forense", conseguimos indetificar que o termo é uma abreviação para "Esteganografia".

> "Esteganografia (do grego “escrita escondida”) é o estudo e uso das técnicas para ocultar a existência de uma mensagem dentro de outra, uma forma de segurança por obscurantismo." // Fonte: [TI Forense](https://www.tiforense.com.br/esteganografia/)

Ao procurar por ferramentas de esteganografia online, encontramos várias opções para uso. Nesse writeup utilizamos a ferramenta [Steganographic Decoder](https://futureboy.us/stegano/decinput.html).

Após abrir o site, faça upload da imagem disponibilizada no desafio.

```
Não é necessário nenhuma ação adicional (senha, outras opções radio button).
Apenas selecione o arquivo em seu computador e clique em "Enviar"
```

Ao terminar o upload da imagem, o site irá carregar uma nova página com a informação necessária para compor a flag do desafio.

---

## Resolução 2 [@Mur0rum](https://github.com/Mur0rum)

O desafio apresenta a seguinte descrição:
```
Nem tudo é o que parece.
Arquivo para download: logoi.jpg
```

Para o início do desafio, foi fornecido um arquivo no formato 'jpg' que, ao abrir, revela o logo da plataforma Insider.
Utilizando um sistema operacional Linux, ao utilizar o comando 'file', o qual diz com mais detalhes o tipo de arquivo baseado em informações internas, é retornado o seguinte:

```
$ file logoi.jpg

logoi.jpg: JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, baseline, precision 8, 495x163, components 3

```

Aparentemente se trata de uma imagem mesmo, sem alterações. Porém quando estamos falando de esteganografia, precisamos olhar com mais atenção e utilizar outras ferramentas para analise.

Diferente do desafio de Steg 1, onde o conteúdo foi inserido diretamente nos dados da imagem, aqui foi utilizada uma técnica onde você camufla um arquivo de outro formato, no caso um txt, dentro do arquivo de imagem sem alterar ou quebrar a estrutura do arquivo original, utilizando o programa [steghide](https://pkg.kali.org/pkg/steghide).

Para extrairmos esse dado, utilize o comando abaixo:

```
$ steghide extract -sf logoi.jpg
Enter passphrase:
```

Uma vez que você se depara com a solicitação de uma senha para extração dos dados, existe um mundo gigante de possibildiades para se tentar, ou pode-se utilizar uma wordlist contendo várias senhas. Mas como nem tudo é o que parece, mantenha a senha em branco e pressione Enter, recebendo a mensagem de confirmação e extração do arquivo 'secret.txt'.

```
Enter passphrase: [senha em branco. Apenas pressione Enter]
wrote extracted data to "secret.txt".

$ cat secret.txt
flag
```
---
[Voltar ao Menu Forense](https://writeup.insidersec.io/forense)
