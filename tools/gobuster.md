# `gobuster`

> Gobuster is an aggressive scan. Its noisy and is noticed. Only use against systems you have permissions to scan against

- The modes
  - `dir` - directory brute forcing
  - `dns` - DNS subdomain brute forcing
  - `vhost` - virtual host brute forcing
  - `wildcard` - wildcard DNS record detection
  - `s3` - S3 bucket brute forcing
  - `file` - file/directory existence bruteforcing
  - `dns` - DNS subdomain brute forcing
  - `tcp` - TCP port scanning
  - `udp` - UDP port scanning

```shell
sudo apt install gobuster

# directory based brute forcing
gobuster dir -u https://example.com -w /wordlists/Discovery/Web-Content/common.txt
gobuster dir -u https://example.com -w /wordlists/Discovery/Web-Content/common.txt -x php,txt,html
gobuster dir -u https://example.com -w /wordlists/Discovery/Web-Content/common.txt -x php,txt,html -t 100 -o gobuster.log --delay 100ms

# dns based brute forcing
gobuster dns -d example.com -w /wordlists/Discovery/DNS/subdomains-top1million-5000.txt
gobuster dns -d example.com -w /wordlists/Discovery/DNS/subdomains-top1million-5000.txt -t 100 -o gobuster.log --delay 100ms
gobuster dns -d example.com -w /wordlists/Discovery/DNS/subdomains-top1million-5000.txt -t 100 -o gobuster.log --delay 100ms -r

# virtual host brute forcing
gobuster vhost -u https://example.com -w /wordlists/Discovery/DNS/subdomains-top1million-5000.txt
# similar flags -t -o --delay -v(verbose) -z(no-progress) -w wordlist -p proxy
gobuster vhost -u https://example.com -w /wordlists/Discovery/DNS/subdomains-top1million-5000.txt -k # skip SSL-TLS verification
```

## Info src

- https://hackertarget.com/gobuster-tutorial/
- 