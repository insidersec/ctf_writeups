# Wireless1

O desafio apresenta a seguinte descrição:

```
Eu DUVIDO você me trazer a senha desse wifi!

> wave.cap (Arquivo para download)
```

### Writeup:

Nesse writeup [recomendamos](https://pt.wikipedia.org/wiki/VirtualBox) a utilização da distribuição [Kali Linux](https://www.kali.org/) devido a variedade de ferramentas oferecidas nativamente no sistema operacional.

Para iniciar a resolução, efetuamos uma busca para descobrir como ler e abrir um arquivo ".cap".

> O arquivo CAP é um arquivo de captura de pacotes, gerado pelo programa sniffing de pacotes. Esses arquivos também são chamados de arquivo de rastreamento ou arquivo de ossos e são usados por vários programas sniffer de pacotes. Esses arquivos CAP consistem em fatos e números brutos que são coletados pelos programas sniffing para que os dados possam ser avaliados posteriormente ou até mesmo com um programa diferente.
> 
> Arquivos de extensão CAP que são arquivos de Captura de pacote podem ser acessados usando o programa gratuito Wireshark ou Microsoft Network Monitor. Existem outros aplicativos que podem ajudar a acessar os arquivos de captura de pacotes .CAP, incluindo a Análise Sniffer do NetScout e o Klos PacketView Pro, entre outros.
> 
> Fonte: [File Extension](https://www.file-extension.info/pt/format/cap)

Junto ao descritivo sobre o tipo do arquivo, podemos verificar também na página uma lista de programas que possibilitam a leitura os dados presentes no arquivo. Dentre as opções, podemos destacar a ferramenta 'Wireshark' por estar disponível para várias plataformas (Windows/Linux/Mac).

Aptos à efetuar a leitura do arquivo, ao carregar as informações no Wireshark temos uma apresentação um tanto quanto confusa e não muito amigável a primeira vista:

![Wireshark - Tela](https://i.imgur.com/Ead2XL0.png)

Previamente contextualizados, seguimos para o próximo passo: como extrair uma senha de um arquivo CAP? Pesquisando por 'how to crack file cap' encontramos [nesse artigo](https://medium.com/@brannondorsey/crack-wpa-wpa2-wi-fi-routers-with-aircrack-ng-and-hashcat-a5a5d3ffea46) uma referência à quebra de senha criptografada através do protocolo [WPA/WPA2](https://pt.wikipedia.org/wiki/Wi-Fi_Protected_Access).

Junto a essa leitura, também encontramos referência à ferramenta '[Hashcat](https://hashcat.net/wiki/doku.php?id=hashcat)'. A partir dessas novas informações, seguimos com uma nova pesquisa buscando 'how to crack WPA/WPA2 hashcat' que nos leva até um [terceiro contexto](https://www.shellvoide.com/wifi/hashcat-guide-how-to-brute-force-crack-wpa-wpa2/) sinalizando a utilização de uma informação chamada PMKID.

Ao verificar o conteúdo do tópico que descreve o processo, podemos notar que a [extração da informação PMKID](https://www.shellvoide.com/wifi/hashcat-guide-how-to-brute-force-crack-wpa-wpa2/#:~:text=Getting%20The%20PMKID%20Hash) é feita de um arquivo CAP. Mantendo a continuidade de nossa trilha de pensamento, seguimos com uma nova busca por 'how to crack WPA/WPA2 pmkid' chegando finalmente aos seguintes artigos:

- [New attack on WPA/WPA2 using PMKID](https://medium.com/@adam.toscher/new-attack-on-wpa-wpa2-using-pmkid-96c3119f7f99)

Nesse primeiro artigo conseguimos nortear nosso raciocínio ao verificar uma imagem que nos remete à uma visualização similar ao que temos no Wireshark.

- [How To Crack WPA/WPA2 Passphrase With PMKID (Hashcat)](https://www.shellvoide.com/wifi/how-to-crack-wpa2-password-without-handshake-newly-discovered-method/)

Nesse segundo arquivo obtemos instruções um pouco mais detalhadas e menos confusas do que é tratado como uma nova maneira de de quebra de senha do protocolo WPA/WPA2, mais precisamente [nesse tópico](https://www.shellvoide.com/wifi/how-to-crack-wpa2-password-without-handshake-newly-discovered-method/#:~:text=Crack%20The%20Code) do passo a passo.

Nele podemos verificar o seguinte comando junto de uma descrição bastante otimista que informa como recebemos a mensagem que o ataque foi efetuado com sucesso:

```
> hashcat -m 16800 --force pmkidhash [wordlist]
```

***Observação:*** _O Hashcat executa um tipo de ataque chamado 'brute force'. Esse tipo de ataque precisa de uma orientação para prover e otimizar como serão as tentativas de quebra da criptografia. Nesse desafio utilizamos o [dicionário de palavras (wordlist)](https://www.tiforense.com.br/download-de-wordlists-para-testes-academicos/) disponível no próprio Kali (rockyou.txt) e que pode ser encontrado [nesse repositório](https://gitlab.com/kalilinux/packages/wordlists)._

Após muita pesquisa temos informações suficientes para voltar a analisar o arquivo do desafio e seguir com os passos para extração da senha. Verificando novamente o arquivo no Wireshark, efetuamos uma busca pela palavra 'PMKID':

![Wireshark - Busca por string](https://i.imgur.com/aRs6B68.png)

Ao localizar a ocorrência, processamos sua extração através da ferramenta 'hcxtools' (que não é nativa do Kali e precisa ser instalada):

```
Atualizar e Instalar Depedências:
> sudo apt-get update
> sudo apt-get install libcurl4-openssl-dev libssl-dev zlib1g-dev libpcap-dev

Instalação:
> git clone https://github.com/ZerBea/hcxtools.git
> cd hcxtools
> sudo make && sudo make install

Comando:
> hcxpcaptool -z pmkidhash wave.cap
```

O resultado da execução sera o arquivo 'pmkidhash' contendo a hash PMKID da senha. Com a extração efetuada, realizamos um ataque do tipo brute force com a ferramenta Hashcat para tentar quebrar a criptografia da senha (esse processo demora um pouco).

```
Comando:
> hashcat -m 16800 --force pmkidhash rockyou.txt
```

O resultado desse processamento será apresentado conforme o seguinte exemplo:

```
Exemplo:
> 2e02d00f75ecb185386884b59622cc81*8c444f8135a5*120ed9b35599*57617665:{SENHA_SERA_EXIBIDA_AQUI}
>                                                  
> Session..........: hashcat
> Status...........: Cracked
> Hash.Type........: WPA-PMKID-PBKDF2
> Hash.Target......: 2e02d00f75ecb185386884b59622cc81*8c444f8135a5*120ed...617665
> Time.Started.....: Thu Jun 25 00:48:58 2020 (40 mins, 58 secs)
> Time.Estimated...: Thu Jun 25 01:29:56 2020 (0 secs)
> Guess.Base.......: File (rockyou.txt)
> Guess.Queue......: 1/1 (100.00%)
> Speed.#1.........:     1548 H/s (9.25ms) @ Accel:512 Loops:128 Thr:1 Vec:8
> Recovered........: 1/1 (100.00%) Digests, 1/1 (100.00%) Salts
> Progress.........: 5835129/14344385 (40.68%)
> Rejected.........: 2130809/5835129 (36.52%)
> Restore.Point....: 5834563/14344385 (40.67%)
> Restore.Sub.#1...: Salt:0 Amplifier:0-1 Iteration:0-1
> Candidates.#1....: mancuso06 -> manchesteR26
```

Analisando o retorno desse processamento, obtemos a informação necessária para compor a flag do desafio.

***Observação:*** _Você pode verificar o resultado do processamento [aqui](https://i.imgur.com/WGnAN8v.png), mas o legal é tentar reproduzir os passos do desafio._

---

[Voltar ao Menu Forense](https://writeup.insidersec.io/forense)
