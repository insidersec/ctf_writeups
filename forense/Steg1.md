# Steg1

O desafio apresenta a seguinte descrição:

```
Há uma mensagem na garrafa. Consegue encontrar?

> ilogo.jpg (Arquivo para download)
```

### Writeup:

## Resolução 1 [@Mur0rum](https://github.com/Mur0rum)

## Info
Esteganografia é o estudo e utilização de técnicas para ocultar uma mengasem dentro de outra, aplicando assim um método de segurança por obscuridade.

Para o início do desafio, foi fornecido um arquivo no formato 'jpg' que, ao abrir, revela o logo da plataforma Insider.
Utilizando um sistema operacional Linux, ao utilizar o comando 'file', o qual diz com mais detalhes o tipo de arquivo baseado em informações internas, é retornado o seguinte:

```
$ file logoi.jpg
ilogo.jpg: JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=4, software=Adobe ImageReady], baseline, precision 8, 495x163, components 3
```

Aparentemente se trata de uma imagem mesmo, sem alterações. Porém quando estamos falando de esteganografia, precisamos olhar com mais atenção o interior dos arquivos.

Ao tentarmos abrir a imagem em algum editor de textos, como bloco de notas, wordpad ou similares, nos deparamos com a estrutura do arquivo.
No início, podem ser exibidas uma série de caracteres sem sentido, porém olhando mais atentamente e até a linha final, é possível identificar uma string de texto, contendo a nossa flag.

Como forma alternativa e usando Linux, podemos utilizar o comando 'strings', o qual extrai de forma mais organizada todos os caracteres de texto dentro de um arquivo:

```
$ strings ilogo.jpg

[...]
].tK8
lpEeY
EijK}
j*5)bj
Sjm9))
m'nU
kWZ|7
}EL87
"xcP
1iEN
Wg.X
i]%&
aW1M
string_de_texto
```

---

## Resolução 2 [@notfounnd](https://github.com/notfounnd)

O desafio apresenta a seguinte descrição:
```
Há uma mensagem na garrafa. Consegue encontrar?
Arquivo para download: ilogo.jpg
```
Para iniciar a resolução desse writeup, precisamos entender à que se refere o termo "Steg". Através da busca "o que é steg forense", conseguimos indetificar que o termo é uma abreviação para "Esteganografia".

> "Esteganografia (do grego “escrita escondida”) é o estudo e uso das técnicas para ocultar a existência de uma mensagem dentro de outra, uma forma de segurança por obscurantismo." // Fonte: [TI Forense](https://www.tiforense.com.br/esteganografia/)

Ao procurar por ferramentas de esteganografia online, encontramos várias opções para uso. Nesse writeup utilizamos a ferramenta [Forensically](https://29a.ch/photo-forensics).

Após abrir o site, faça upload da imagem disponibilizada no desafio.

Quando a foto for carregada, ele será exibida na tela e um menu do lado direito estará habilitado com outras opções de análise.

Ao selecionar a opção "String Extraction", uma série de informações de texto serão exibidas na tela.

```
Exemplo:
> JFIF
> XExif
> Adobe ImageReady
> %&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz
> &'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz
> .
> .
> .
> 1iEN
> aW1M
> flag está na última linha
```

Ao verificar a última linha dessas informações, obtemos a informação necessária para compor a flag do desafio.

---
[Voltar ao Menu Forense](https://writeup.insidersec.io/forense)
