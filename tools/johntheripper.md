# `john` The Ripper

`john` needs .john format file
Utils for conversion: `ssh2john`, `zip2john`, `pdf2john`, `gpg2john`, `rar2john`, `keepass2john`, `keychain2john`, `unshadow`

```shell
# install
sudo apt install john

ssh2john id_rsa > id_rsa.john
john --wordlist=/usr/share/wordlists/rockyou.txt id_rsa.john

zip2john file.zip > file.zip.john 
john --wordlist=/usr/share/wordlists/rockyou.txt file.zip.john
```
