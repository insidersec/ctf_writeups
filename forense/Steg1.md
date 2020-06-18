# Steg1

O desafio apresenta a seguinte descrição:

```
Há uma mensagem na garrafa. Consegue encontrar?

> ilogo.jpg (Arquivo para download)
```

### Writeup:

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
