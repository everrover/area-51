# `wget`

Used to download files from the net.

## Usage

```bash
wget -O <filename> <url>
wget -c https://www.example.com/file.zip # continue download
wget -b https://www.example.com/file.zip # run in background
wget -c --limit-rate=200k https://www.example.com/file.zip # limit downlink speed
tail -f wget-log # check progress
wget --ftp-user=narad --ftp-password=password ftp://ftp.example.com/filename.tar.gz # download from ftp
wget --http-user=narad --http-password=password http://http.example.com/filename.tar.gz # download from http
wget --no-check-certificate https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.1.1.tar.gz
```