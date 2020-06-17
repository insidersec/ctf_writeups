# Cyber5

```
user: cyber5
pass: [flag cyber4]
```
### Writeup:

Ao tentarmos dar um `cat` no arquivo flag.txt notamos que diversos caracteres, letras e símbolos aparecem na tela.
Quando usamos o comando `file` descobrimos que o arquivo, na verdade é um arquivo compactado.

Ao extrairmos, usamos o file novamente no arquivo e notamos que ainda está compactado com outro tipo de compressão. Assim sendo, temos que ir descobrindo o tipo de compressão usado e ir descompactando:

```
mkdir /tmp/cyber5
cd /tmp/cyber5 
cp /home/cyber5/flag.txt .

file flag.txt
mv flag.txt flag.kgb
kgb flag.kgb

file flag.txt
mv flag.txt flag.xz
xz -d flag.xz

file flag.txt
mv flag.txt flag.bz2
bzip2 -d flag.bz2

file flag.txt
mv flag.txt flag.zip
unzip flag.zip

file flat.txt
cat flag.txt
```

---

[Voltar ao Menu Infraestrutura](https://github.com/insidersec/ctf_writeups/blob/master/Infraestrutura/infraestrutura.md)